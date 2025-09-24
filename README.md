# WIP README INCOMING

those are my dotfiles, not complete as i use home-manager to set up parts of my config, you can view it here : https://github.com/e-v-o-l-v-e/nix-config

i manage these config with stow, i recommande to have a ~/.dotfiles or similar, in your home dir as it simplyfies the command

to install a package just 

- copy the content of this repo to you ~/.dotfiles or equivalent
- cd into it
- execute `stow --dotfiles <package name>`

the package name is the dir name of the config you want to use

you can specify several packages in the same command

the `--dotfiles` arg is to convert the dot-config in each package to `.config`, don't forget it or it will create a `~/dot-config`

you can specify a target -- aka where to put the files -- with `-t <target_dir>`, by default stow will use its parent

you can specify a source with `-d <source_dir>`, by default stow will the current dir

example command, setting up the waybar conf from any location :

`stow --dotfiles -t ~ -d .dotfiles -S waybar`

the `-S` is optionally, but i find it more readable that way

you can also remove or restow

stow works by creating symlinks, if you have any other question just RTM : `man stow`
