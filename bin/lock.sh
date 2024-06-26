#!/bin/sh

alpha='dd'
background='#282a36'
selection='#44475a'
comment='#6272a4'

yellow='#f1fa8c'
orange='#ffb86c'
red='#ff5555'
magenta='#ff79c6'
blue='#6272a4'
cyan='#8be9fd'
green='50fa7b'

wallpaper_files=(~/Pictures/wallpaper.*)
wallpaper_location="${wallpaper_files[0]}"

if [[ "$(loginctl show-session "$XDG_SESSION_ID" -p Type --value)" == "wayland" ]]; then
  if command -v hyprlock; then
    hyprlock
  else
    swaylock \
      -i "$wallpaper_location" \
      --ignore-empty-password \
      --inside-ver-color=$selection$alpha \
      --inside-wrong-color=$selection$alpha \
      --inside-color=$selection$alpha \
      --ring-ver-color=$green$alpha \
      --ring-wrong-color=$red$alpha \
      --ring-color=$blue$alpha \
      --line-uses-ring \
      --key-hl-color=$magenta$alpha \
      --bs-hl-color=$orange$alpha \
      --separator-color=$selection$alpha \
      --clock \
      --indicator \
      --timestr="%H:%M:%S" \
      --datestr="%e. %B %Y" \
      --font="JetBrainsMono Nerd Font" \
      --indicator-radius=120
  fi
else
  if command -v betterlockscreen; then
    betterlockscreen -l
  # check for i3-color by checking if the version output contains the creator's name, "Raymond Li"
  # i3lock -v prints to STDERR for some reason, so we'll just redirect STDERR to STDOUT
  elif (i3lock -v 2>&1 | grep -q -i "Raymond"); then
    echo i3lock-color installed, using that
    # thanks to fccapria for this config!
    # https://github.com/fccapria/myDracula/blob/1a8e20c74da164aa4c243ca6137c7f565f7d6ab7/scripts/lock.sh
    i3lock \
      --insidever-color=$selection$alpha \
      --insidewrong-color=$selection$alpha \
      --inside-color=$selection$alpha \
      --ring-ver-color=$green$alpha \
      --ring-wrong-color=$red$alpha \
      --ring-ver-color=$green$alpha \
      --ring-wrong-color=$red$alpha \
      --ring-color=$blue$alpha \
      --line-uses-ring \
      --keyhl-color=$magenta$alpha \
      --bshl-color=$orange$alpha \
      --separator-color=$selection$alpha \
      --wrong-color=$red \
      --layout-color=$blue \
      --date-color=$blue \
      --time-color=$blue \
      --screen 1 \
      --blur 2 \
      --clock \
      --indicator \
      --time-str="%H:%M:%S" \
      --date-str="%A, %e. %B %Y" \
      --verif-text="Checking..." \
      --wrong-text="Wrong!" \
      --noinput="No Input" \
      --lock-text="Locking..." \
      --lockfailed="Lock Failed" \
      --time-font="JetBrainsMono Nerd Font" \
      --date-font="JetBrainsMono Nerd Font" \
      --layout-font="JetBrainsMono Nerd Font" \
      --verif-font="JetBrainsMono Nerd Font" \
      --wrong-font="JetBrainsMono Nerd Font" \
      --radius=120 \
      --ring-width=10 \
      --pass-media-keys \
      --pass-screen-keys \
      --pass-volume-keys
  else
    echo 'No i3lock-color installed, using vanilla i3lock'
    i3lock -i "$wallpaper_location"
  fi
fi
