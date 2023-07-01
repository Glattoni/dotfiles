#!/bin/sh

xrandr --output DisplayPort-2 --mode 3440x1440 --rate 144 &
lxsession &
picom &
nitrogen --restore &
