#!/bin/bash

xmodmap ~/.xmodmaprc
xcompmgr -c -o.25 -r40 -f -F -l-5 -t-5 -D5 &

xfce4-panel &
#tint2 &
/usr/lib/xfce4/xfce4-notifyd &
xfce4-volumed &
wicd-gtk &
skype &
pidgin &
google-chrome --memory-model=low &

while true;
do
  awsetbg -r ~/.wallpaper
  sleep 10m
done &

exec ck-launch-session awesome
