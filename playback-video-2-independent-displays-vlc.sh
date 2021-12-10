#!/bin/bash

export GST_VAAPI_ALL_DRIVERS=1

if [ x$1 == "x" ]
then
	echo "Missing video file name for argument 1"
	exit 1
fi

if [ x$2 == "x" ]
then
        echo "Missing video file name for argument 2"
        exit 1
fi


echo "Launching video on display 1"
swaymsg workspace 1
vlc $1 --fullscreen &
sleep 5

echo "Launching video on display 2"
swaymsg workspace 2
vlc $2 --fullscreen
