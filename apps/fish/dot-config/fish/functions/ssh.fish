function ssh --argument-names=argv
    set -lx TERM xterm-256color
    command ssh $argv
end
