--https://gist.github.com/maxbane/9521612#file-xmonad-hs-L43

import XMonad
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.EZConfig

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops

import XMonad.Layout.NoBorders
import XMonad.Layout.Circle
import XMonad.Layout.Grid
import XMonad.Layout.ResizableTile
import XMonad.Layout.ThreeColumns
-- import XMonad.Layout.Fullscreen
import XMonad.Layout.Gaps
import Data.Monoid
import System.Exit
import XMonad.Util.Run
import System.IO

import Control.Monad

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Actions.CycleWS


myBorderWidth = 0

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

{-
Xmobar configuration variables. These settings control the appearance
of text which xmonad is sending to xmobar via the DynamicLog hook.
-}

myTitleColor = "#eeeeee" -- color of window title
myTitleLength = 80 -- truncate window title to this length
myCurrentWSColor = "#e6744c" -- color of active workspace
myVisibleWSColor = "#c185a7" -- color of inactive workspace
myUrgentWSColor = "#cc0000" -- color of workspace with 'urgent' window
myCurrentWSLeft = "[" -- wrap active workspace with these
myCurrentWSRight = "]"
myVisibleWSLeft = "(" -- wrap inactive workspace with these
myVisibleWSRight = ")"
myUrgentWSLeft = "{" -- wrap urgent workspace with these
myUrgentWSRight = "}"


-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP {
-- ppCurrent = xmobarColor "#429942" "" . wrap "<" ">"
    ppTitle = xmobarColor myTitleColor "" . shorten myTitleLength
    , ppCurrent = xmobarColor myCurrentWSColor ""
    . wrap myCurrentWSLeft myCurrentWSRight
    , ppVisible = xmobarColor myVisibleWSColor ""
    . wrap myVisibleWSLeft myVisibleWSRight
    , ppUrgent = xmobarColor myUrgentWSColor ""
    . wrap myUrgentWSLeft myUrgentWSRight
}


toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)


-- http://www.nepherte.be/step-by-step-configuration-of-xmonad/
myManageHook = composeAll . concat $
    [
          -- Applications that go to web
        [ className =? "Firefox" --> viewShift "web"]
        , [ className =? "Vim" --> viewShift "code"]
    ]
    where
        viewShift = doF . liftM2 (.) W.greedyView W.shift


-- Define default layouts used on most workspaces
defaultLayouts = smartBorders(avoidStruts(
    ResizableTall 1 (3/100) (1/2) []
    -- ||| Mirror (ResizableTall 1 (3/100) (1/2) [])
    ||| noBorders Full
    -- ||| Grid
    ||| ThreeColMid 1 (3/100) (3/4)
    -- ||| Circle
    ))

-- Define layout for specific workspaces
webLayout = noBorders $ Full

-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig {
    modMask = mod1Mask,
    terminal = "urxvt",
    borderWidth = myBorderWidth,
    manageHook = myManageHook,
    handleEventHook = fullscreenEventHook,
    -- border colors from solarized dark palette
    focusedBorderColor = "#268bd2",
    normalBorderColor = "#586e75"
    } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]


