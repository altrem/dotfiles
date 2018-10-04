import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ desktopConfig {
        terminal = "konsole",
	modMask  = mod4Mask,
	logHook  = dynamicLogWithPP xmobarPP {
	    ppOutput = hPutStrLn xmproc,
	    ppTitle  = xmobarColor "green" "" . shorten 50
	}
    }
