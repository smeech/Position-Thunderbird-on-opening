#!/bin/sh

thunderbird "$@" &

until wmctrl -l -x | grep -q 'Mail.Thunderbird'; do sleep 1; done

wid=$(wmctrl -l -x | grep 'Mail.Thunderbird' | cut -f1 -d' ')

wmctrl -ir "$wid" -b remove,maximized_vert,maximized_horz
wmctrl -ir "$wid" -e '0,1280,0,-1,-1'
wmctrl -ir "$wid" -b add,maximized_vert,maximized_horz
