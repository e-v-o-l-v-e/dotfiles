require("lua.env") -- technically not needed but who knows

-- reload waybar
hl.bind("CTRL + Escape", hl.dsp.exec_cmd("pkill waybar || waybar"))


-- terminal
hl.bind("SUPER + Return", hl.dsp.exec_cmd(Terminal))


-- apps
hl.bind("SUPER + W", hl.dsp.exec_cmd(Browser))
hl.bind("SUPER + E", hl.dsp.exec_cmd(Terminal .. " yazi"))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd(FileManagerGUI))
hl.bind("SUPER + SHIFT + CTRL + Return", hl.dsp.exec_cmd(ScriptDir .. "/edit-temp.fish nvim"))
hl.bind("SUPER + SHIFT + CTRL + ALT + Return", hl.dsp.exec_cmd(ScriptDir .. "/edit-temp.fish vim"))


-- rofi
hl.bind("SUPER + A", hl.dsp.exec_cmd("pkill -x rofi || rofi -show"))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd([[pkill -x rofi || rofi -show drun -filter "wallpaper" -selected-row 2]]))
hl.bind("SUPER + SHIFT + CTRL + ALT + L",
  hl.dsp.exec_cmd([[pkill -x rofi || fish -c 'rofi -show picker -modes "picker:power"']]))


-- clipboard
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))


-- screenshot
hl.bind("Print", hl.dsp.exec_cmd([[grim - | wl-copy && notify-send "Clipboard" "Whole screen copied to clipboard"]]),
  { locked = true, description = "Screenshot >> clipboard" })
hl.bind("SUPER + SHIFT + S",
  hl.dsp.exec_cmd([[slurp | grim -g - - | wl-copy && notify-send "Clipboard" "Screenshot copied to clipboard"]]),
  { locked = true, description = "Screenshot part >> clipboard" })


-- lock
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("wlogout"), { description = "logout menu" })


-- sound
local maxVolume = "1.3"

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 0.05- --limit " .. maxVolume),
  { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 0.05+ --limit " .. maxVolume),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"),
  { locked = true, repeating = true })

hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("SUPER + SHIFT + Space", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
-- hl.bind("XF86AudioPlayPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl pause"), { locked = true })


-- brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })


-- WINDOWS --
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + D", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind("SUPER + Z", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pin())

hl.bind("ALT + Tab", hl.dsp.window.cycle_next())

hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

-- resize
hl.bind("SUPER + SHIFT + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })

-- mouse
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:274", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- switch to workspace
for i = 1, 10 do
  hl.bind("SUPER + " .. (i % 10), hl.dsp.focus({ workspace = i }))
end

-- move to workspace
for i = 1, 10 do
  hl.bind("SUPER + SHIFT + " .. (i % 10), function()
    if hl.get_active_workspace().id ~= i then
      hl.dispatch(hl.dsp.window.move({ workspace = i }))
    else
      hl.dispatch(hl.dsp.window.move({ workspace = "previous" }))
    end
  end)
end


-- move silently to workspace (Alt_R counts as Alt)
for i = 1, 10 do
  hl.bind("SUPER + Alt_R + " .. (i % 10), function()
    if hl.get_active_workspace().id ~= i then
      hl.dispatch(hl.dsp.window.move({ workspace = i, follow = false }))
    else
      hl.dispatch(hl.dsp.window.move({ workspace = "previous", follow = false }))
    end
  end)
end


-- move window
hl.bind("CTRL + SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind("CTRL + SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("CTRL + SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("CTRL + SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("CTRL + SUPER + SHIFT + right", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind("CTRL + SUPER + SHIFT + left", hl.dsp.window.move({ workspace = "r-1" }))


-- THEMING
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd("fish -c theme-switcher"))
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd("fish -c kitty-session-picker"))

-- gestures
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- quickshell
hl.bind("SUPER + I", hl.dsp.exec_cmd("qs -c dms ipc call settings toggle"))
