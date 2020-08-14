-------------------------------------------------
--   __   __                                _  --
--   \ \ / /                               | | --
--    \ V / _ __ ___   ___  _ __   __ _  __| | --
--     > < | '_ ` _ \ / _ \| '_ \ / _` |/ _` | --
--    / . \| | | | | | (_) | | | | (_| | (_| | --
--   /_/ \_\_| |_| |_|\___/|_| |_|\__,_|\__,_| --
-------------------------------------------------

-- Imports
import XMonad
import XMonad.Operations
import System.IO
import System.Exit
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Actions.SpawnOn
import XMonad.Util.NamedScratchpad
import XMonad.Util.EZConfig(additionalKeys)
import Data.List (sortBy)
import Data.Function (on)
import Control.Monad (forM_, join)
import XMonad.Util.Run (safeSpawn)
import XMonad.Util.NamedWindows (getName)
import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.CycleWS
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks    -- dock/tray mgmt
import Data.Monoid
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import System.Exit
--Layouts
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.Fullscreen
import XMonad.Layout.ToggleLayouts          -- Full window at any time
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Mosaic
import XMonad.Layout.ThreeColumns
import XMonad.Layout.FixedColumn
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.WindowArranger
import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

-- Colors.
c_gray = "#928374"
c_gray_alt = "#a89984"
c_red = "#cc241d"
c_blue = "#458588"
c_white = "#eeeeee"
c_green = "#98971a"
c_yellow_alt = "#fabd2f"

-- Layout string.
curLayout :: X String
curLayout = gets windowset >>= return . description . W.layout . W.workspace . W.current

myTerminal = "termite"

-- Spawn vars.
spRofi = "rofi -modi drun -show drun -display-drun 'Run'"
spMaim = "maim -sl -u -c 0.2,0.4,1.0,0.7 -b 0 | xclip -selection clipboard -t image/png"

---- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
myWorkspaces :: [String]
myWorkspaces = ["1:\xfa9e", "2: \xe7c5", "3: \xfb6e", "4: \xf0c0", "5: \xf023", "6: \xf718", "7: \xe70f", "8: \xf1b6", "9: \xf085"]

binds conf@(XConfig {XMonad.modMask = modm}) = M.fromList $ [
    ((modm,               xK_Return), spawn $ "termite"),
    ((modm,               xK_d     ), spawn spRofi),
    ((modm,               xK_q     ), kill),
    ((modm,               xK_s     ), spawn "rofi -show ssh"),
    ((modm .|. shiftMask, xK_s     ), spawn spMaim),
    ((modm .|. shiftMask, xK_l     ), spawn "xscreensaver-command --lock"),
    ((modm,               xK_Tab   ), sendMessage NextLayout >> (curLayout >>= \d->spawn $"notify-send "++d)),
    ((modm,               xK_f     ), sendMessage ToggleLayout),
    ((modm .|. shiftMask, xK_o     ), setLayout $ XMonad.layoutHook conf),
    ((modm,               xK_j     ), windows W.focusDown),
    ((modm,               xK_k     ), windows W.focusUp),
    ((modm .|. shiftMask, xK_j     ), windows W.swapDown),
    ((modm .|. shiftMask, xK_k     ), windows W.swapUp),
    ((modm              , xK_i     ), sendMessage (IncMasterN 1)),
    ((modm              , xK_o     ), sendMessage (IncMasterN (-1))),
    ((modm,               xK_h     ), sendMessage Shrink),
    ((modm,               xK_l     ), sendMessage Expand),
    ((modm .|. shiftMask, xK_space ), withFocused $ windows . W.sink),
    ((modm .|. shiftMask, xK_l     ), spawn "betterlockscreen -l"),
    ((modm,               xK_r     ), refresh),
    ((modm              , xK_u      ), spawn "termite --name floatterm -e fzmp"),
    ((modm              , xK_g      ), spawn "termite --name floatterm -e lazygit"),
    ((modm              , xK_e      ), spawn "termite --name floatterm -e ranger"),
    ((modm              , xK_n      ), spawn "termite --name floatterm -e ncmpcpp"),
    ((modm              , xK_m      ), spawn "neomutt_mailbox"),
    ((modm              , xK_b      ), spawn "rofi -modi bw:rofi-bw -show bw"),
    ((modm              , xK_a      ), spawn "termite --name floatterm -e calcurse"),
    ((modm              , xK_v      ), spawn "cbp"),
    ((modm              , xK_p      ), spawn "mpc toggle"),
    ((modm              , xK_period ), spawn "mpc next"),
    ((modm              , xK_comma  ), spawn "mpc prev"),
    ((modm              , xK_p      ), spawn "mpc toggle"),
    ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess)),
    ((modm,               xK_Down),  nextWS),
    ((modm,               xK_Up),    prevWS),
    ((modm .|. shiftMask, xK_Right), shiftNextScreen),
    ((modm .|. shiftMask, xK_Left),  shiftPrevScreen),
    ((modm              , xK_F2     ), spawn "xmonad --recompile; xmonad --restart")

    ] ++ [((m .|. modm, k), windows $ f i)
    | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
    --, (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
    ]
    -- ++ [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
    -- | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
    -- | (key, sc) <- zip [] [0..]
    --, (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

---spawn
--
myStartupHook = do
    spawnOnce "bing-wallpaper"
    spawnOnce "discord"
    spawnOnce "nm-applet"
    spawnOnce "launch_polybar"
    spawnOnce "protonmail-bridge"

myManageHook = composeAll [
    -- Positions.
    className =? "discord" --> doShift "3",
    className =? "teams-for-linux" --> doShift "4",
    className =? "ckb-next" --> doShift "9",
    -- Float.
    resource  =? "bitwarden" --> doRectFloat (W.RationalRect 0.2 0.2 0.6 0.6),
    resource  =? "floatterm" --> doRectFloat (W.RationalRect 0.2 0.2 0.6 0.6),
    resource  =? "pavucontrol" --> doRectFloat (W.RationalRect 0.2 0.2 0.6 0.6),
    resource  =? "gnome-panel" --> doCenterFloat,
    title     =? "Firefox Preferences" --> doFloat,
    title     =? "Session Manager - Mozilla Firefox" --> doFloat,
    title     =? "Firefox Add-on Updates" --> doFloat,
    title     =? "Clear Private Data" --> doFloat,
    -- Fullscreen.
    isFullscreen --> doFullFloat
    ]

-- Mouse bindings

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2), (\w -> focus w >> windows W.shiftMaster))
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

-- A standard tiled layout, with a master pane and a secondary pane off to
-- the side.  The master pane typically holds one window; the secondary
-- pane holds the rest.  Copied from standard xmonad.hs template config.
tiledLayout = Tall nmaster delta ratio
  where
    nmaster = 1      -- The default number of windows in the master pane.
    ratio   = 1/2    -- Default proportion of screen occupied by master pane.
    delta   = 3/100  -- Percent of screen to increment by when resizing panes.

-- Per-workspace layouts.  We set up custom layouts (and even lists of
-- custom layouts) for the most important workspaces, so we can tweak
-- window management fairly precisely.
--
-- Inspired by:
--   http://kitenet.net/~joey/blog/entry/xmonad_layouts_for_netbooks/
workspaceLayouts =
  onWorkspace "1:\xfa9e" webLayouts $
  onWorkspace "2: \xe7c5" codeLayouts $
  onWorkspace "3: \xfb6e" imLayouts $
  defaultLayouts
  where
    -- Combinations of our available layouts, which we can cycle through
    -- using mod-Space.  'Mirror' applies a 90-degree rotation to a layout.
    codeLayouts = fixedLayout ||| tiledLayout ||| simpleTabbed
    webLayouts = tiledLayout
    imLayouts = simpleTabbed ||| Mirror tiledLayout
    defaultLayouts = tiledLayout ||| Mirror tiledLayout ||| fixedLayout |||
                     floatLayout ||| simpleTabbed

    -- An 80-column fixed layout for Emacs and terminals.  The master
    -- pane will resize so that the contained window is 80 columns.
    fixedLayout = FixedColumn 1 20 80 10

    -- A simple floating-window layout.  This isn't particularly good,
    -- to be honest, but further configuration might improve it.
    floatLayout = windowArrange simpleFloat

-- Hook up my layouts.  We apply 'toggleLayouts' so that we can switch any
-- window into or out of full-screen mode with a single command (see
-- below).  We use 'smartBorders' to turn off the border around the focused
-- window if it's the only window on the screen.  And 'avoidStruts' leaves
-- space for gnome-panel and xmobar.
myLayout = avoidStruts $ smartBorders $ toggleLayouts Full workspaceLayouts

main = do
  forM_ [".xmonad-workspace-log", ".xmonad-title-log"] $ \file -> do
    safeSpawn "mkfifo" ["/tmp/" ++ file]
    xmonad $ewmh $ docks $ defaults { logHook = eventLogHook }

eventLogHook = do
  winset <- gets windowset
  title <- maybe (return "") (fmap show . getName) . W.peek $ winset
  let currWs = W.currentTag winset
  let wss = map W.tag $ W.workspaces winset
  let wsStr = join $ map (fmt currWs) $ sort' wss

  io $ appendFile "/tmp/.xmonad-title-log" (title ++ "\n")
  io $ appendFile "/tmp/.xmonad-workspace-log" (wsStr ++ "\n")

  where fmt currWs ws
          | currWs == ws = " %{F" ++ c_yellow_alt ++ "}" ++ ws ++ "%{F-} "
          | otherwise    = " %{F" ++ c_gray ++ "}" ++ ws ++ "%{F-} "
        sort' = sortBy (compare `on` (!! 0))

defaults = def{
    modMask= mod4Mask,
    terminal = myTerminal,
    workspaces = myWorkspaces,
    keys = binds,
    layoutHook = smartBorders $ myLayout,
    focusedBorderColor = "red",
    normalBorderColor = c_gray_alt,
    mouseBindings = myMouseBindings,
    manageHook = myManageHook <+> manageHook def,
    borderWidth = 2,
    startupHook = myStartupHook
    }
