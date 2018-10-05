import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run

import qualified Data.Map as M

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ desktopConfig {
        terminal = "konsole",
	modMask  = mod4Mask,
	logHook  = dynamicLogWithPP xmobarPP {
	    ppOutput = hPutStrLn xmproc,
	    ppTitle  = xmobarColor "green" "" . shorten 50
	},
	keys = \c -> myKeys c `M.union` keys defaultConfig c
    }
    where
        myKeys (XConfig {modMask = modm}) = M.fromList $ [ ((modm, xK_r), spawn "rofi -show run") ]
