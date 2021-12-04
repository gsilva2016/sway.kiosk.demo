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
gst-launch-1.0 filesrc location=$1 ! qtdemux ! vaapih264dec ! vaapisink fullscreen=1 &
sleep 1

echo "Launching video on display 2"
swaymsg workspace 2
gst-launch-1.0 filesrc location=$2 ! qtdemux ! vaapih264dec ! vaapisink fullscreen=1

