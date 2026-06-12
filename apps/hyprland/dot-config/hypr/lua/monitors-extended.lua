local mainMonitor = "eDP-1"
local secondaryMonitor = "HDMI-A-1"

hl.monitor({ output = mainMonitor, mode = "preferred", position = "auto", scale = 1 })
hl.monitor({ output = secondaryMonitor, mode = "preferred", position = "auto", scale = 1 })

hl.workspace_rule({ workspace = "1", monitor = mainMonitor })
hl.workspace_rule({ workspace = "2", monitor = mainMonitor })
hl.workspace_rule({ workspace = "3", monitor = mainMonitor })
hl.workspace_rule({ workspace = "4", monitor = mainMonitor })
hl.workspace_rule({ workspace = "5", monitor = secondaryMonitor })
