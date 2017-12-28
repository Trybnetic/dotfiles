#!/bin/bash

# Specify resource paths
TMPBG=/tmp/screen.png
LOCK_ICON=/home/trybnetic/.config/i3/img/lock.png

# Specify blur
HUE=(-level 0%,100%,0.6)
EFFECT=(-filter Gaussian -resize 20% -define filter:sigma=1.5 -resize 500.5%)

# Regex for display resolution
RESOLUTION="([0-9]+)x([0-9]+)\\+([0-9]+)\\+([0-9]+)"

# Get Monitor resolutions
MONITORS=$(xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*')

# Specify square widths
SQUARE_W=300
SQUARE_H=300
SQUARE_R=10
SQUARE_O=0.7

# Calculate squares for every monitor
DRAW=""
for MONITOR in $MONITORS
do
  if [[ $MONITOR =~ $RESOLUTION ]]; then
    SCREEN_WIDTH=${BASH_REMATCH[1]}
    SCREEN_HEIGHT=${BASH_REMATCH[2]}
    SCREEN_X=${BASH_REMATCH[3]}
    SCREEN_Y=${BASH_REMATCH[4]}

    SQUARE_X=$((($SCREEN_WIDTH - $SQUARE_W) / 2 + $SCREEN_X))
    SQUARE_Y=$((($SCREEN_HEIGHT - $SQUARE_H) / 2 + $SCREEN_Y))
    SQUARE_X2=$(($SQUARE_X + $SQUARE_W))
    SQUARE_Y2=$(($SQUARE_Y + $SQUARE_H))

    DRAW+="roundRectangle $SQUARE_X,$SQUARE_Y $SQUARE_X2,$SQUARE_Y2 $SQUARE_R,$SQUARE_R "
  fi
done

# Take picture of the screen
scrot $TMPBG

# Blur the picture and add the square
convert $TMPBG "${HUE[@]}" "${EFFECT[@]}" -draw "fill black fill-opacity $SQUARE_O $DRAW" $TMPBG

# Add lock icon
convert -gravity center $TMPBG $LOCK_ICON -composite $TMPBG

# Run i3lock with the image
i3lock -i $TMPBG -e -u

# Remove picture
rm $TMPBG
