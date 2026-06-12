-- Directories
HomeDir = os.getenv("HOME")
HyprDir = HomeDir .. "/.config/hypr"
ScriptDir = HyprDir .. "/scripts"


-- Application s
Terminal = "kitty"
Browser = "zen-twilight"
FileManager = "yazi"
FileManagerGUI = "nautilus"

-- hl.env("TERMINAL", Terminal)
hl.env("HyprDir", HyprDir)


-- Input method
-- See https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("SDL_IM_MODULE", "fcitx")
hl.env("GLFW_IM_MODULE", "ibus")
hl.env("INPUT_METHOD", "fcitx")


-- Wayland
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")


-- Theming
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("XDG_MENU_PREFIX", "plasma-")

