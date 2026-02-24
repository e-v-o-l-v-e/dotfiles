#!/usr/bin/env fish

if test (count $argv) -lt 1
    echo need at least one argument
    exit
end

set interface "wlp1s0" # TODO this system is kind of bad, hardcoding an interface is weird

set app $argv[1]
echo "app to launch: $app"

if test (count $argv) -eq 2
    set condition $argv[2]

    switch $condition

        # if interface is disconnected, do not launch the app
        # usefull for browser etc
        case network
            echo "condition required: network"
            echo "interface to check: $interface"
            nmcli | rg $interface | head -n 1 | rg disconnected
            if test $status -eq 0
                echo "$interface is disconnected, not launching the app"
                exit
            end
    end
end

hyprctl clients | rg "class: $app"

if test $status -ne 0
    echo "no instance of $app was detected"
    $app
else
    echo "an instance of $app is already running"
end
