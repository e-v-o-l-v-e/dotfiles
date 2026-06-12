-- local mainMonitor = "eDP-1"
local mainMonitor = "HDMI-A-1"

hl.monitor({ output = mainMonitor, mode = "1920x1080@60", position = "auto", scale = 1 })
hl.monitor({ output = "", mode = "1920x1080@60", position = "auto", scale = 1, mirror = mainMonitor })
