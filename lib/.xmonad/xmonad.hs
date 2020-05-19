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

myTerminal = "termite"
---- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
myWorkspaces :: [String]
myWorkspaces = ["1:\xfa9e", "2: \xe7c5", "3: \xfb6e", "4: \xf0c0", "5: \xf023", "6: \xf718", "7: \xe70f", "8: \xf1b6", "9: \xf085"]

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_d     ), spawn "rofi -modi drun -show drun")
    , ((modm,               xK_q     ), kill),
    ((modm .|. shiftMask,   xK_s     ), spawn "maim -sl -u -c 0.2,0.4,1.0,0.7 -b 0 | xclip -selection clipboard -t image/png")

     -- Rotate through the available layout algorithms
    , ((modm,               xK_Tab ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_o ), setLayout $ XMonad.layoutHook conf)

    --, ((modm,               xK_n     ), refresh)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp  )
    , ((modm,               xK_i     ), windows W.focusMaster  )
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm .|. shiftMask, xK_space ), withFocused $ windows . W.sink),
    --, ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    --, ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    ((modm              , xK_u      ), spawn "termite --name floatterm -e fzmp"),
    ((modm              , xK_g      ), spawn "termite --name floatterm -e lazygit"),
    ((modm              , xK_e      ), spawn "termite --name floatterm -e ranger"),
    ((modm              , xK_n      ), spawn "termite --name floatterm -e ncmpcpp"),
    ((modm              , xK_m      ), spawn "termite --name floatterm -e neomutt"),
    ((modm              , xK_a      ), spawn "termite --name floatterm -e calcurse"),
    ((modm              , xK_v      ), spawn "cbp"),
    ((modm              , xK_p      ), spawn "mpc toggle"),
    ((modm              , xK_period ), spawn "mpc next"),
    ((modm              , xK_comma  ), spawn "mpc prev")

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm              , xK_F2     ), spawn "xmonad --recompile; xmonad --restart")
    ]

    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

    ++
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        -- | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        | (key, sc) <- zip [] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

---spawn
--
myStartupHook = do
    spawnOnce "bing-wallpaper"
    spawnOnce "discord"
    spawnOnce "compton -f"
    spawnOnce "nm-applet"
    spawnOnce "launch_polybar"
 
myManageHook = composeAll [
    -- Positions.
    className =? "discord" --> doShift "3",
    className =? "teams-for-linux" --> doShift "4",
    className =? "ckb-next" --> doShift "9",
    -- Float.
    resource  =? "floatterm" --> doRectFloat (W.RationalRect 0.2 0.2 0.6 0.6),
    className =? "Gimp" --> doCenterFloat,
    title     =? "Firefox Preferences" --> doFloat,
    title     =? "Session Manager - Mozilla Firefox" --> doFloat,
    title     =? "Firefox Add-on Updates" --> doFloat,
    title     =? "Clear Private Data" --> doFloat
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

myLayoutHook = avoidStruts (
       toggleLayouts Full (Grid) ||| toggleLayouts Full (ThreeColMid 1 (1/20) (1/2)) ||| simpleTabbed ||| toggleLayouts Full (tiled) ||| Mirror tiled)
        where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio
 
    -- The default number of windows in the master pane
    nmaster = 1
 
    -- Default proportion of screen occupied by master pane
    ratio   = 1/2
 
    -- Percent of screen to increment by when resizing panes

delta = 3/100 
----Main Function

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
          | currWs == ws = " %{F" ++ c_white ++ "}" ++ ws ++ "%{F-} "
          | otherwise    = " %{F" ++ c_gray ++ "}" ++ ws ++ "%{F-} "
        sort' = sortBy (compare `on` (!! 0))

defaults = def{
    modMask= mod4Mask
    , terminal = myTerminal
    , workspaces = myWorkspaces
    , keys = myKeys
    , layoutHook = smartBorders $ myLayoutHook
    , focusedBorderColor = c_blue
    , normalBorderColor = c_gray_alt
    , mouseBindings = myMouseBindings                           
    , manageHook = myManageHook <+> manageHook def
    , borderWidth = 2
    , startupHook = myStartupHook
    }
