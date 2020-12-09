import System.IO
import System.Exit
import Data.List (sortBy)
import Data.Function (on)
import Graphics.X11.ExtraTypes.XF86
import Control.Monad (forM_, join)
import Data.Monoid
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

import XMonad
import XMonad.Operations
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Util.NamedScratchpad
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run (safeSpawn)
import XMonad.Util.NamedWindows (getName)
import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn

import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import XMonad.Prompt
import XMonad.Prompt.ConfirmPrompt

import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.Fullscreen
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Mosaic
import XMonad.Layout.ThreeColumns
import XMonad.Layout.CenteredMaster
import XMonad.Layout.Gaps
import XMonad.Layout.FixedColumn
import XMonad.Layout.Simplest
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

defaults = def {
    borderWidth = size_border,
    modMask = myModMask,
    terminal = myTerminal,
    workspaces = myWorkspaceNames,
    keys = binds,
    layoutHook = smartBorders $ myLayoutHook,
    focusedBorderColor = "red",
    normalBorderColor = c_gray_alt,
    mouseBindings = myMouseBindings,
    manageHook = myManageHook <+> manageHook def,
    startupHook = myStartupHook
}

main = do xmonad
    $ ewmh
    $ docks
    $ withUrgencyHook LibNotifyUrgencyHook
    $ defaults

-- sizes
size_gap = 3
size_topbar = 10
size_border = 0
size_prompt = 20

-- Colors.
c_dark_gray = "#282828"
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


-- Spawn vars.
spawnRofi = "rofi -modi drun -show drun -display-drun 'Run'"
spawnGnomeScreenshot = "gnome-screenshot --area --border-effect=shadow --file=/tmp/screenshot && xclip -i -selection clipboard -target image/png < /tmp/screenshot && rm /tmp/screenshot"

myWorkspaceNames :: [String]
myWorkspaceNames    = ["Firefox","Programming","Instant Messaging","SSH","Bitwarden","Virtual Machines","WINE Games","Steam Games","Settings"]
myFont      = "-*-dejavu-*-*-*-*-16-*-*-*-*-*-*"
myBigFont   = "-*-dejavu-*-*-*-*-24-*-*-*-*-*-*"
myFocusFollowsMouse  = False
myClickJustFocuses   = True
myTerminal = "termite"

topBarTheme = def
    { fontName              = myFont
    , inactiveBorderColor   = c_dark_gray
    , inactiveColor         = c_dark_gray
    , inactiveTextColor     = c_dark_gray
    , activeBorderColor     = c_blue
    , activeColor           = c_blue
    , activeTextColor       = c_blue
    , urgentBorderColor     = c_red
    , urgentTextColor       = c_yellow_alt
    , decoHeight            = size_topbar
    }

myTabTheme = def
    { fontName              = myFont
    , activeColor           = c_blue
    , inactiveColor         = c_dark_gray
    , activeBorderColor     = c_blue
    , inactiveBorderColor   = c_dark_gray
    , activeTextColor       = c_white
    , inactiveTextColor     = c_white
    }

myPromptTheme = def
    { font                  = myFont
    , bgColor               = c_dark_gray
    , fgColor               = c_white
    , fgHLight              = c_white
    , bgHLight              = c_blue
    , borderColor           = c_dark_gray
    , promptBorderWidth     = 0
    , height                = size_prompt
    , position              = Top
    }

warmPromptTheme = myPromptTheme
    { bgColor               = c_yellow_alt
    , fgColor               = c_white
    , position              = Top
    }

hotPromptTheme = myPromptTheme
    { bgColor               = c_red
    , fgColor               = c_white
    , position              = Top
    }


myModMask = mod4Mask
binds conf@(XConfig {XMonad.modMask = modm}) = M.fromList $ [
    -- General
    ((modm,               xK_q      ), kill),
    ((modm,               xK_r     ), refresh),
    ((modm .|. shiftMask, xK_q     ), confirmPrompt hotPromptTheme "Quit XMonad" $ io (exitWith ExitSuccess)),
    -- Spawn
    ((modm,               xK_Return ), spawn $ "termite"),
    ((modm,               xK_d      ), spawn spawnRofi),
    ((modm,               xK_s      ), spawn "rofi -show ssh"),
    ((modm .|. shiftMask, xK_s      ), spawn spawnGnomeScreenshot ),
    ((modm .|. shiftMask, xK_l      ), spawn "xscreensaver-command --lock"),
    ((modm .|. shiftMask, xK_l      ), spawn "betterlockscreen -l"),
    ((modm              , xK_u      ), spawn "termite --name floatterm -e fzmp"),
    ((modm              , xK_g      ), spawn "termite --name floatterm -e lazygit"),
    ((modm              , xK_e      ), spawn "termite --name floatterm -e ranger"),
    ((modm              , xK_n      ), spawn "termite --name floatterm -e ncmpcpp"),
    ((modm              , xK_a      ), namedScratchpadAction myScratchpads "calendar"),
    ((modm              , xK_w      ), namedScratchpadAction myScratchpads "weechat"),
    ((modm              , xK_m      ), spawn "neomutt_mailbox"),
    ((modm              , xK_v      ), spawn "cbp"),
    ((modm              , xK_p      ), spawn "mpc toggle"),
    ((modm              , xK_period ), spawn "mpc next"),
    ((modm              , xK_comma  ), spawn "mpc prev"),
    ((modm              , xK_p      ), spawn "mpc toggle"),
    -- Navigation
    ((modm,               xK_j     ), windows W.focusDown),
    ((modm,               xK_k     ), windows W.focusUp),
    ((modm .|. shiftMask, xK_j     ), windows W.swapDown),
    ((modm .|. shiftMask, xK_k     ), windows W.swapUp),
    -- Windows and layouts
    ((modm              , xK_i     ), sendMessage (IncMasterN 1)),
    ((modm              , xK_o     ), sendMessage (IncMasterN (-1))),
    ((modm,               xK_h     ), sendMessage Shrink),
    ((modm,               xK_l     ), sendMessage Expand),
    ((modm .|. shiftMask, xK_space ), withFocused $ windows . W.sink),
    ((modm,               xK_Tab   ), sendMessage NextLayout >> (curLayout >>= \d->spawn $"notify-send "++d)),
    ((modm,               xK_f     ), sendMessage ToggleLayout),
    ((modm .|. shiftMask, xK_o     ), setLayout $ XMonad.layoutHook conf),
    ((modm,               xK_Down),  nextWS),
    ((modm,               xK_Up),    prevWS),
    ((modm .|. shiftMask, xK_Right), shiftNextScreen),
    ((modm .|. shiftMask, xK_Left),  shiftPrevScreen),
    ((modm              , xK_F2     ), spawn "xmonad --recompile; xmonad --restart")

    ] ++ [((m .|. modm, k), windows $ f i)
    | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
    , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
    ]

myStartupHook = do
    spawnOnce "bing-wallpaper"
    spawnOnce "nm-applet"
    spawnOnce "launch_polybar"
    spawnOnce "tmux has-session -t protonmail_bridge || tmux new -d -s protonmail_bridge 'protonmail-bridge --cli'"
    spawnOn "Firefox" "ps ax | grep firefox | grep -v grep || firefox-developer-edition"
    spawnOn "Instant Messaging" "pgrep Discord || discord"
    spawnOn "Instant Messaging" "pgrep teams-for-linux || teams-for-linux"
    spawnOn "Settings" "pgrep ckb-next || ckb-next"
    spawnOn "Settings" "pgrep blueman || blueman"
    spawnOn "Bitwarden" "pgrep bitwarden || bitwarden"

myManageHook = composeAll [
    -- Positions.
    className =? "discord" --> doShift "Instant Messaging",
    className =? "teams-for-linux" --> doShift "Instant Messaging",
    className =? "ckb-next" --> doShift "Settings",
    -- Float.
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
    <+> namedScratchpadManageHook myScratchpads

data LibNotifyUrgencyHook = LibNotifyUrgencyHook deriving (Read, Show)
instance UrgencyHook LibNotifyUrgencyHook where
    urgencyHook LibNotifyUrgencyHook w = do
        name     <- getName w
        Just idx <- fmap (W.findTag w) $ gets windowset

        safeSpawn "notify-send" [show name, "workspace " ++ idx]

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    [
        -- mod-button1, Set the window to floating mode and move by dragging
        ((modMask, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster)),
        -- mod-button2, Raise the window to the top of the stack
        ((modMask, button2), (\w -> focus w >> windows W.shiftMaster))
    ]

myLayoutHook =
    onWorkspace "Instant Messaging" tabs
    $ onWorkspace "Programming" threeCol
    $ toggleLayouts Full tall ||| threeCol ||| tabs
    where
        addTopBar = noFrillsDeco shrinkText topBarTheme
        mySpacing = spacing size_gap
        myGaps = gaps [(U, 0),(D, 0),(L, size_gap),(R, size_gap)]

        threeCol = named "ThreeColumn"
             $ avoidStruts
             $ addTopBar
             $ myGaps
             $ mySpacing
             $ ThreeColMid 1 (1/10) (1/2)

        tabs = named "Tabs"
             $ avoidStruts
             $ addTabs shrinkText myTabTheme
             $ Simplest

        tall = named "Tall"
            $ avoidStruts
            $ addTopBar
            $ myGaps
            $ mySpacing
            $ Tall 1 (3/100) (1/2)

myScratchpads = [
    NS "calendar" "termite --name scrpd_calcurse -e calcurse" (resource =? "scrpd_calcurse") (customFloating $ W.RationalRect (1/4) (1/4) (2/4) (2/4)),
    NS "weechat" "termite --name scrpd_weechat -e weechat" (resource =? "scrpd_weechat") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
    ]
