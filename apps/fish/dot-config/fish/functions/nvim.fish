function nvim --argument-names=argv
    command nvim -c "colorscheme $nvim_theme" $argv
end
