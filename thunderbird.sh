#!/bin/sh

thunderbird "$@" &

while ! wmctrl -l | grep -q Thunderbird; do sleep 1; done

wid=$(wmctrl -l | grep Thunderbird | awk '{print $1;}')

wmctrl -ir "$wid" -b remove,maximized_vert,maximized_horz
wmctrl -ir "$wid" -e '0,1280,0,-1,-1'
wmctrl -ir "$wid" -b add,maximized_vert,maximized_horz
