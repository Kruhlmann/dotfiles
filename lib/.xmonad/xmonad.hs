import System.IO
import System.Exit
import Data.List (sortBy)
import Data.Function (on)
import Graphics.X11.ExtraTypes.XF86
import Control.Monad (forM_, join)
import Data.Monoid
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
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
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.WindowArranger

-- Colors.
c_dark_gray = "#282828"
c_gray = "#928374"
c_gray_alt = "#a89984"
c_red = "#cc241d"
c_blue = "#458588"
c_white = "#eeeeee"
c_green = "#98971a"
c_yellow_alt = "#fabd2f"

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

myTerminal      = "alacritty"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myBorderWidth   = 0
myModMask       = mod4Mask
myWorkspaces :: [String]
myWorkspaces    = ["Firefox","Programming","Instant Messaging","Email","Bitwarden","Virtual Machines","WINE Games","Steam Games","Settings"]
myFont      = "-*-dejavu-*-*-*-*-16-*-*-*-*-*-*"
myBigFont   = "-*-dejavu-*-*-*-*-24-*-*-*-*-*-*"
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#009999"

-- layout string
curLayout :: X String
curLayout = gets windowset >>= return . description . W.layout . W.workspace . W.current

-- spawn vars
spawnRofi = "rofi -modi drun -show drun -display-drun 'Run'"
spawnMaim = "maim -u -s | xclip -selection clipboard -t image/png"

-- sizes
size_gap = 0
size_topbar = 0
size_border = 1
size_prompt = 0

data LibNotifyUrgencyHook = LibNotifyUrgencyHook deriving (Read, Show)
instance UrgencyHook LibNotifyUrgencyHook where
    urgencyHook LibNotifyUrgencyHook w = do
        name     <- getName w
        Just idx <- fmap (W.findTag w) $ gets windowset

        safeSpawn "notify-send" [show name, "workspace " ++ idx]

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $ [
    -- General
    ((modm,               xK_q      ), kill),
    ((modm,               xK_r     ), refresh),
    ((modm .|. shiftMask, xK_q     ), confirmPrompt hotPromptTheme "Quit XMonad" $ io (exitWith ExitSuccess)),
    -- Spawn
    ((modm,               xK_Return ), spawn $ "alacritty"),
    ((modm,               xK_d      ), spawn spawnRofi),
    ((modm,               xK_s      ), spawn "rofi -show ssh"),
    ((modm .|. shiftMask, xK_s      ), spawn spawnMaim ),
    ((modm .|. shiftMask, xK_l      ), spawn "portable-lock"),
    ((modm              , xK_u      ), spawn "alacritty --class floatterm -e fzmp"),
    ((modm              , xK_g      ), spawn "alacritty --class floatterm -e lazygit"),
    ((modm              , xK_e      ), spawn "alacritty --class floatterm -e ranger"),
    ((modm              , xK_n      ), spawn "alacritty --class floatterm -e ncmpcpp"),
    ((modm              , xK_b      ), spawn "manage_bluetooth_devices"),
    ((modm              , xK_m      ), spawn "neomutt_mailbox"),
    ((modm              , xK_v      ), spawn "sudo virt-viewer win10"),
    ((modm .|. shiftMask, xK_v      ), spawn "vkc \"$(cat ~/.cache/gain/password)\" da | while read -r key; do printf 'sudo virsh send-key win10 %s\\n' \"$key\"; done | bash - >/dev/null                                                                                          ─╯ sudo virsh send-key win10 KEY_ENTER"),
    ((modm              , xK_p      ), spawn "mpc toggle"),
    ((modm              , xK_period ), spawn "mpc next"),
    ((modm              , xK_comma  ), spawn "mpc prev"),
    ((modm              , xK_p      ), spawn "mpc toggle"),
    ((modm              , xK_c      ), spawn "notify-send \"Now\" \"$(date \"+%A, %B %d %R\")\" --expire-time=1000"),
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
    ((modm,               xK_Tab   ), sendMessage NextLayout),
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


myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    [
        ((modMask, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster)),
        ((modMask, button2), (\w -> focus w >> windows W.shiftMaster)),
        ((modMask, button3), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster))
    ]

myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

myLayoutHook = toggleLayouts Full tall ||| threeCol ||| tabs
    where
        myGaps = gaps [(U, 0),(D, 0),(L, size_gap),(R, size_gap)]
        -- mySpacing = spacing size_gap
        mySpacing = spacing 0

        threeCol = named "ThreeColumn"
            $ avoidStruts
            $ myGaps
            $ mySpacing
            $ ThreeColMid 1 (1/10) (1/2)

        tabs = named "Tabs"
            $ avoidStruts
            $ mySpacing
            $ addTabs shrinkText myTabTheme
            $ Simplest

        tall = named "Tall"
            $ avoidStruts
            $ myGaps
            $ mySpacing
            $ Tall 1 (3/100) (1/2)

myManageHook = composeAll [
    -- Positions.
    className =? "discord" --> doShift "Instant Messaging",
    className =? "teams-for-linux" --> doShift "Instant Messaging",
    className =? "microsoft-edge-dev" --> doShift "Instant Messaging",
    className =? "microsoft-edge" --> doShift "Instant Messaging",
    className =? "ckb-next" --> doShift "Settings",
    className =? "blueman-manager" --> doShift "Settings",
    className =? "Blueman-manager" --> doShift "Settings",
    -- Float.
    resource  =? "floatterm" --> doRectFloat (W.RationalRect 0.2 0.2 0.6 0.6),
    resource  =? "pavucontrol" --> doRectFloat (W.RationalRect 0.2 0.2 0.6 0.6),
    resource  =? "gnome-panel" --> doCenterFloat,
    className     =? "xmessage" --> doCenterFloat,
    title     =? "Firefox Preferences" --> doFloat,
    title     =? "Session Manager - Mozilla Firefox" --> doFloat,
    title     =? "Firefox Add-on Updates" --> doFloat,
    title     =? "Clear Private Data" --> doFloat,
    className =? "awakened-poe-trade" --> doFloat,
    -- Fullscreen.
    isFullscreen --> doFullFloat
    ]

myEventHook = mempty
myLogHook = return ()

myStartupHook = do
    spawnOnce "nm-applet"
    spawnOnce "setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl"
    spawnOnce "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
    spawnOnce "blueman-manager"
    spawnOnce "find ~/.ssh/ -type f -exec grep -l \"PRIVATE\" {} \\; | xargs ssh-add >/dev/null"
    spawnOnce "feh --bg-scale \"$HOME/img/wallpaper\""
    spawnOnce "sh \"$HOME/.config/hostnamerc.d/$(hostname)\""
    spawnOnce "sh \"$HOME/.scripts/mpdevents\""
    spawnOnce "dunst"
    spawnOnce "xbindkeys"
    spawnOnce "xset r rate 416 25"
    spawnOnce "xset dpms 0 0 300"
    spawnOnce "xss-lock -- \"$HOME/.scripts/portable-lock\""
    spawnOnce "ls ~/.xmonad/xmonad.hs | entr sh -c 'xmonad --recompile; xmonad --restart'"
    spawnOnce "autorandr --change"

main = do xmonad
    $ ewmh
    $ docks
    $ withUrgencyHook LibNotifyUrgencyHook
    $ defaults

defaults = def {
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = 1,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        -- normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
        layoutHook         = myLayoutHook,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }
