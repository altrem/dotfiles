import XMonad
import XMonad.Config.Desktop

main = xmonad desktopConfig
    {
        terminal = "konsole",
	modMask  = mod4Mask
    }
