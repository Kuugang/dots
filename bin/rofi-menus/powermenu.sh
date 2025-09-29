#!/bin/env bash

choice=$(printf "  Lock\n󰍃  Logout\n󰒲  Suspend\n  Reboot\n  Shutdown" | rofi -dmenu)

case "$choice" in
  "  Lock") sh $HOME/bin/screen-lock.sh ;;
  "󰍃  Logout") hyprctl dispatch exit 0 ;;
  "󰒲  Suspend") sh $HOME/bin/screen-lock.sh --suspend ;;
  "  Reboot") reboot ;;
  "  Shutdown") shutdown -h now ;;
esac
