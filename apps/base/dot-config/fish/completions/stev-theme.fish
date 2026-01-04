# stev-theme completions
complete -c stev-theme -f

# basic options
complete -c stev-theme -o h -l help -d 'show help'
complete -c stev-theme -o l -l list -d 'show themes'
complete -c stev-theme -l wall-dir -r -d 'set wallpaper directory'
complete -c stev-theme -o f -l full-name -x -a "(__stev_theme_get_full)" -d 'full theme name'
complete -c stev-theme -o r -l reset-waypaper -d 'reset waypaper\'s default dir'

# wallpaper options
complete -c stev-theme -n "not __fish_seen_subcommand_from -w --wallpaper" -o w -l wallpaper -d 'set wallpaper behavior'
complete -c stev-theme -n "__fish_seen_subcommand_from -w --wallpaper; and not __fish_seen_subcommand_from never once always" -x -a never -d 'never change wallpaper'
complete -c stev-theme -n "__fish_seen_subcommand_from -w --wallpaper; and not __fish_seen_subcommand_from never once always" -x -a once -d 'change wallpaper once'
complete -c stev-theme -n "__fish_seen_subcommand_from -w --wallpaper; and not __fish_seen_subcommand_from never once always" -x -a always -d 'always change wallpaper'
# complete -c stev-theme -n "__fish_seen_subcommand_from -w --wallpaper" -x -a not-now -d 'do not change now, but change next times'

complete -c stev-theme -s i -l image -rF -d 'set IMAGE as wallpaper'

# dynamic theme completion helpers
function __stev_theme_get_names
    if test -d "$dots_path/themes"
        find "$dots_path/themes" -maxdepth 1 -mindepth 1 -type d -printf "%f\n" \
            | string replace -r -- '-light$|-dark$' '' \
            | sort -u
    end
end

function __stev_theme_get_full
    if test -d "$dots_path/themes"
        find "$dots_path/themes" -maxdepth 1 -mindepth 1 -type d -printf "%f\n"
    end
end

# helpers for mutual exclusivity
function __stev_theme_has_variant
    for arg in (commandline -xpc)
        if contains -- $arg light dark
            return 0
        end
    end
    return 1
end

function __stev_theme_has_name
    set -l names (__stev_theme_get_names)
    for arg in (commandline -xpc)
        if contains -- $arg $names
            return 0
        end
    end
    return 1
end

# 1. Improved check for option arguments
function __stev_theme_is_option_arg
    # -p: current process (this command)
    # -c: cut at cursor (ignore what we are currently typing)
    # -o: tokenize (tokenize the string)
    set -l tokens (commandline -xpc)
    
    # If the last thing we typed was a flag that requires an argument, 
    # we return 0 (true) to signal we are in an "option argument" state.
    if set -q tokens[-1]
        contains -- $tokens[-1] -w --wallpaper --wall-dir -i --image -f --full-name
        return $status
    end
    return 1
end

# 2. Updated Completion calls
# We suggest themes/variants regardless of flag presence, 
# as long as we aren't currently filling a flag's specific argument.

complete -c stev-theme -k -n "not __stev_theme_is_option_arg; and not __stev_theme_has_name" \
    -a "(__stev_theme_get_names)" -d 'theme'

complete -c stev-theme -k -n "not __stev_theme_is_option_arg; and not __stev_theme_has_variant" \
    -a "dark light" -d 'variant'
