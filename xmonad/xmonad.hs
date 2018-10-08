import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks

import qualified Data.Map as M

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ desktopConfig {
        terminal = "konsole",
	modMask  = mod4Mask,
	logHook  = dynamicLogWithPP xmobarPP {
	    ppOutput = hPutStrLn xmproc,
	    ppTitle  = xmobarColor "#c89544" "" . shorten 50
	},
	layoutHook = myCustomLayout,
	focusedBorderColor = myFocusedBorderColor,
	keys = \c -> myKeys c `M.union` keys defaultConfig c
    }
    xmonad $ docks def
    where
        myKeys (XConfig {modMask = modm}) = M.fromList $ [ ((modm, xK_r), spawn "rofi -show run"), ((modm, xK_Print), spawn "imgur-screenshot") ]
	myFocusedBorderColor = "#c89544"

myCustomLayout = spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True $ avoidStruts (tall ||| Mirror tall) 
    where tall = Tall 1 (3/100) (1/2)
