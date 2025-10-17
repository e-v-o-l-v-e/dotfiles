# WIP

# My dotfiles

## Just gimme this

1. Install
```sh
git clone https://github.com/e-v-o-l-v-e/dotfiles.git ~/.dotfiles
stow --dotfiles --dir ~/.dotfiles --target ~ -S base
```
2. Enable
```sh
stap app1 [, app2, ...]
change-theme gruvbox-dark
```

## Structure
```
.
├── base
├── apps
│   ├── hyprland
│   ├── kitty
│   └── etc...
└── themes
    ├── gruvbox-dark
    ├── gruvbox-light
    └── etc...
```

## Apps

The `apps` directory contains most of my applications' configurations, you can enable any config with 
```sh
stap kitty hyprland gtk
```

stap is just a little fish script that wrap stow, and allow to easily set some variables, to use it you must run this command before :
```sh
stow --dotfiles --dir ~/.dotfiles --target ~ -S base
```

> [!NOTE]
> If you put the dotfiles elsewhere change `~/.dotfiles` to your location, and then run `stap -p [you-dots-path]`

This will make `stap` and `change-theme` commands available, given your `.local/bin` is in your $PATH, and add applications to easily use with your launcher.

> [!WARNING]
> Those are fish scripts, not bash script, make sure fish is installed if you want to use them!

If you don't want to use my scripts you can just use vanilla stow:
```
stow --dotfiles --dir ~/.dotfiles/apps --target ~ -S kitty hyprland
```

## Themes

Themes are located in the themes folder and follow the `$name-$variant` pattern, with variant one of dark or light.

Using `change-theme`:
```
change-theme [name] [variant]
```

> [!NOTE]
> There is only gruvbox dark and light themes right now, next on the list is tokyonight

if you don't want to use `change-theme`:
```sh
stow --dotfiles --dir ~/.dotfiles/themes --target ~ -R gruvbox-dark -S gruvbox-light
```

