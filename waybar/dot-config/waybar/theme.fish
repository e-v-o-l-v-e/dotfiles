#!/usr/bin/env fish

function print_status
    if test "$THEME" = "light"
        echo '{"text": "󰛨", "tooltip": "Light theme"}'
    else
        echo '{"text": "", "tooltip": "Dark theme"}'
    end
end

function generate_color
  set wp (swww query | sed -n 's/.*image: \(.*\)$/\1/p')
  matugen image $wp -m $THEME # -t scheme-expressive 
  kill -SIGUSR1 (pgrep kitty) # for some 
end

switch $argv[1]
    case --toggle
        if test "$THEME" = "light"
            fish ~/.config/waybar/theme.fish dark
        else
            fish ~/.config/waybar/theme.fish light
        end

        print_status

    case --status
        print_status

    case dark
      set -U THEME "dark"
      generate_color

    case light
      set -U THEME "light"
      generate_color

end

