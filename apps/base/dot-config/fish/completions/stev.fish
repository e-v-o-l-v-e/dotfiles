# disable file completions
complete -c stev -f

# basic options
complete -c stev -s h -l help -d 'Show help'
complete -c stev -s l -l list -d 'List packages'
complete -c stev -s g -l grep -x -d 'Search packages'

# config options
complete -c stev -s p -l path -d 'Set/Print dotfiles path'

# package management options (old-style to prevent grouping)
complete -c stev -o S -d 'Stow package'
complete -c stev -o D -d 'Unstow package'
complete -c stev -o R -d 'Restow package (default)'

# dynamic package completion
# path to dotfiles must be set
if set -q dots_path
    function __stev_get_packages
        if test -d "$dots_path/apps"
            # ls -1 --indicator-style=none "$dots_path/apps"
            # fd -d1 -td --format {/} . "$dots_path/apps"
            find "$dots_path/apps" -maxdepth 1 -mindepth 1 -type d -not -empty -printf "%f\n"
        end
    end

    # suggest packages for -S -D and -R
    complete -c stev -n "not __fish_seen_subcommand_from -l -h -p -g" -a "(__stev_get_packages)"
end
