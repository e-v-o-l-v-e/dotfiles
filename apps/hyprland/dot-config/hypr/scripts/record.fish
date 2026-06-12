#!/usr/bin/env fish

set required_cmds wf-recorder slurp pactl hyprctl jq notify-send pgrep pkill grep cut
set missing
for cmd in $required_cmds
    if not command -q $cmd
        set -a missing $cmd
    end
end
if test (count $missing) -gt 0
    notify-send "Recording Error" "Missing required programs: $missing" -a 'Recorder'
    exit 1
end

function getdate
    date '+%Y-%m-%d_%H.%M.%S'
end

function getaudiooutput
    pactl list sources | grep 'Name' | grep 'monitor' | cut -d ' ' -f2
end

function getactivemonitor
    hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name'
end

set xdgvideo (xdg-user-dir VIDEOS)
if test "$xdgvideo" = "$HOME" -o -z "$xdgvideo"
    set xdgvideo "$HOME/Videos"
end

mkdir -p "$xdgvideo"
cd "$xdgvideo"; or exit

if pgrep wf-recorder > /dev/null
    notify-send "Recording Stopped" "Stopped" -a 'Recorder' &
    disown
    pkill wf-recorder &
    disown
else
    if test "$argv[1]" = "--fullscreen-sound"
        notify-send "Starting recording" "/Videos/recording_"(getdate)".mp4" -a 'Recorder' &
        disown
        wf-recorder -o (getactivemonitor) --pixel-format yuv420p -f "./recording_"(getdate)".mp4" -t --audio=(getaudiooutput)
    else if test "$argv[1]" = "--fullscreen"
        notify-send "Starting recording" "/Videos/recording_"(getdate)".mp4" -a 'Recorder' &
        disown
        wf-recorder -o (getactivemonitor) --pixel-format yuv420p -f "./recording_"(getdate)".mp4" -t
    else
        set region (slurp 2>&1)
        if test $status -ne 0
            notify-send "Recording cancelled" "Selection was cancelled" -a 'Recorder' &
            disown
            exit 1
        end
        notify-send "Starting recording" "/Videos/recording_"(getdate)".mp4" -a 'Recorder' &
        disown
        if test "$argv[1]" = "--sound"
            wf-recorder --pixel-format yuv420p -f "./recording_"(getdate)".mp4" -t --geometry "$region" --audio=(getaudiooutput)
        else
            wf-recorder --pixel-format yuv420p -f "./recording_"(getdate)".mp4" -t --geometry "$region"
        end
    end
end
