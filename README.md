# My dotfiles

## Just gimme this

0. Dependencies
- stow
- fish (if you wish to use my scripts)
    - find (or fd)
    - dconf if you care about gtk (you most probably do)
    - swww 
    - waypaper (optionnal but recommended)
    - ripgrep (optionnal but recommended)
    - matugen if you want to dynamically generate colors for some apps, you must symlink your wallpaper to ~/.wallpaper (my waypaper config is set to do so)

1. Install
```sh
git clone https://github.com/e-v-o-l-v-e/dotfiles.git ~/.dotfiles
stow --dotfiles --dir ~/.dotfiles/apps --target ~ -S base
```

2. Use
```sh
stev kitty hyprland gtk waybar rofi matugen waypaper wlogout
stev-theme gruvbox dark
```

> [!NOTE]
> My scripts are in the fish language, but they will work regardless of your shell

## Structure
```
.
├── apps
│   ├── base
│   ├── kitty
│   ├── hyprland
│   └── etc...
└── themes
    ├── gruvbox-dark
    ├── tokyonight-light
    └── etc...
```

## Apps

The `apps` directory contains most of my applications' configurations, you can enable any config with 
```sh
stev kitty hyprland gtk
```

stev is a fish script wrapping stow, to use it you must run this command before :
```sh
stow --dotfiles --dir ~/.dotfiles/apps --target ~ -S base
```

> [!NOTE]
> If you put the dotfiles elsewhere change `~/.dotfiles` to your location, and then run `stev -p dotfiles-path`

This will make `stev` and `stev-theme` commands available, given your `.local/bin` is in your `$PATH`, and add applications to easily use with your launcher.

> [!WARNING]
> Those are fish scripts, not bash script, make sure fish is installed if you want to use them!

If you don't want to use my scripts you can just use vanilla stow:
```sh
stow --dotfiles --dir ~/.dotfiles/apps --target ~ -S kitty hyprland
```

But you will missout on those sweet autocompletions I took far too much time setting up :) (only for fish users though).

## Themes

Themes are located in the themes folder and follow the `$name-$variant` pattern, with variant being one of "dark" or "light".

Using `stev-theme`:
```
stev-theme [name] [variant] [options]
```
Note that the order of args and option doesn't matter. See `stev-theme -h` for
a list of all options.

Availables Themes:
- gruvbox
- tokyonight

if you don't want to use `stev-theme`: 
```sh 
stow --dotfiles --dir ~/.dotfiles/themes --target ~ -R gruvbox-dark -S gruvbox-light
```

### Wallpaper

I implemented some wallpaper management with it (disabled but default). 
To use it your walls must be sorted in subfolders named after the theme name
(excluding variant, eg `walldir/tokyonight`), allowing to always get an
appropriate wallpaper.

## Conclusion

This is just a small sumary, the scripts are commented and come with a complete help page, don't hesite to read them, open issues etc
