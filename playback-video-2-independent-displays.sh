#!/bin/bash

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
gst-play-1.0 $1 &
sleep 1

echo "Launching video on display 2"
swaymsg workspace 2
gst-play-1.0 $2 

