-- Disable blur for xwayland context menus
hl.window_rule({ match = { class = "^()$", title = "^()$" }, no_blur = true })

-- Kitty
hl.window_rule({ match = { class = "kitty" }, opacity = "0.85 0.85" })

-- File dialogs and common popups
hl.window_rule({ match = { title = "^(Open File)(.*)$" }, float = true, center = true })
hl.window_rule({ match = { title = "^(Select a File)(.*)$" }, float = true, center = true })
hl.window_rule({ match = { title = "^(Choose wallpaper)(.*)$" }, float = true, center = true, size = { "monitor_w*0.6", "monitor_h*0.65" } })
hl.window_rule({ match = { title = "^(Open Folder)(.*)$" }, float = true, center = true })
hl.window_rule({ match = { title = "^(Save As)(.*)$" }, float = true, center = true })
hl.window_rule({ match = { title = "^(Library)(.*)$" }, float = true, center = true })
hl.window_rule({ match = { title = "^(File Upload)(.*)$" }, float = true, center = true })
hl.window_rule({ match = { title = "^(.*)(wants to save)$" }, float = true, center = true })
hl.window_rule({ match = { title = "^(.*)(wants to open)$" }, float = true, center = true })

-- Blueman
hl.window_rule({ match = { class = "^(.*blueman.*)$" }, float = true, size = { "monitor_w*0.45", "monitor_h*0.45" } })
hl.window_rule({ match = { class = "^(l.*blueman.*)$" }, center = true })

-- Pavucontrol
hl.window_rule({ match = { class = "^(pavucontrol)$" }, float = true, size = { "monitor_w*0.45", "monitor_h*0.45" }, center = true })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true, size = { "monitor_w*0.45", "monitor_h*0.45" }, center = true })

-- Network manager
hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, float = true, size = { "monitor_w*0.45", "monitor_h*0.45" }, center = true })

-- No shadow for tiled
hl.window_rule({ match = { float = false }, no_shadow = true })

-- Tearing
hl.window_rule({ match = { title = ".*\\.exe" }, immediate = true })
hl.window_rule({ match = { title = ".*minecraft.*" }, immediate = true })
hl.window_rule({ match = { class = "^(steam_app).*" }, immediate = true })

-- Picture-in-Picture
hl.window_rule({
  match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
  float = true,
  keep_aspect_ratio = true,
  move = { "monitor_w*0.64", "monitor_h*0.64" },
  size = { "monitor_w*0.35", "monitor_h*0.35" },
  pin = true,
})

hl.window_rule({ match = { class = "zen-twilight" }, no_initial_focus = true })

-- Godot
hl.window_rule({ match = { class = "Godot" }, workspace = "3 silent", tile = true })

-- Apps
local move_wi_to_wo_sil = function(match, workspace)
  hl.window_rule({
    match = match,
    workspace = workspace .. " silent",
    no_initial_focus = true,
    suppress_event = "activatefocus activate"
  })
end

move_wi_to_wo_sil({ class = "vesktop" }, 4)
move_wi_to_wo_sil({ class = "steam" }, 5)
move_wi_to_wo_sil({ initial_title = "Element" }, 4)

-- Waypaper
hl.window_rule({ match = { class = "waypaper" }, float = true, size = { 860, 880 }, center = true })

-- KDE Connect presentation mode
hl.window_rule({
  match = { title = "KDE Connect Daemon" },
  opacity = "1 override",
  no_blur = true,
  decorate = false,
  no_shadow = true,
  no_anim = true,
  no_focus = true,
  suppress_event = "fullscreen",
  float = true,
  pin = true,
  -- min_size = {width, height},  -- TODO: fill in actual resolution
  move = { 0, 0 },
})

-- Layer rules
hl.layer_rule({ match = { namespace = "rofi" }, no_anim = true })
hl.layer_rule({ match = { namespace = "gtk4-layer-shell" }, no_anim = true })

hl.layer_rule({ match = { namespace = "shell:bar" }, blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "shell:notifications" }, blur = true, ignore_alpha = 0.1 })


-- global transparency, override any previous transparency setting
hl.window_rule({ match = { class = ".*" }, opacity = "1 override 1 override" })
