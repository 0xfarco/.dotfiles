#!/bin/bash

if [[ -f ~/Video/output.mkv ]]
  then
    n=1
    while [[ -f $HOME/Video/output_$n.mkv ]]
    do
      n=$((n+1))
    done
    filename="$HOME/Video/output_$n.mkv"
  else
    filename="$HOME/Video/output.mkv"
fi

ffmpeg -y \
-f x11grab \
-s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
-i :0.0 \
-f alsa -i default \
 -c:v libx264 -r 30 -c:a flac $filename
 #-c:v ffvhuff -r 30 -c:a flac $filename \
 #-f pulse -ac 1 -ar 44100 -i default \
