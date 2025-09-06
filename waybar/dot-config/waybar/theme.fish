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
  matugen image $wp -m $THEME -t scheme-expressive 
end

switch $argv[1]
    case --toggle
        if test "$THEME" = "light"
            set -U THEME "dark"
        else
            set -U THEME "light"
        end

        generate_color

        # refresh waybar module via signal
        # pkill -RTMIN+3 waybar

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

