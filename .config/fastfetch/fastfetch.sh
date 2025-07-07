#!/bin/bash
# Return a random logo image from the logo folder

logo_dir="$HOME/.config/fastfetch/logo"
find "$logo_dir" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | shuf -n 2
