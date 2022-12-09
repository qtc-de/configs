#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type 'xrandr'; then

    # The first bar loaded gets the tray. Make sure it is on the
    # primary monitor and load bars on other monitors with a delay
    PRIMARY=$(polybar -m | grep 'primary' | cut -d':' -f1);

    if [ -n "${PRIMARY}" ]; then
        MONITOR=$m polybar --reload mybar &
        sleep 1
    fi

    for m in $(polybar -m | grep -v 'primary' | cut -d':' -f1); do
        MONITOR=$m polybar --reload mybar &
    done

else
    polybar --reload mybar &
fi

echo '[+] Bars launched...'
