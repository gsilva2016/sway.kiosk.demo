# sway.kiosk.demo
Demo illustrating two independent displays for video playback as can be useful for Kiosk use cases.



**Ubuntu 20.04 LTS Installation Steps**

1. sudo apt update && sudo apt install -y sway
2. Open the config file and scroll down to the text "output DP-1".  Currently this config file will support 2 displays side by side (horizontal from each other) using 1920x1080@60Hz on DP-1 and DP-2 interfaces/connectors. To find your connector names open a terminal and type: sudo cat /sys/kernel/debug/dri/0/i915_display_info and look "status: connected" which indicate available displays/connectors.
3. Modify both names DP-1 and DP-2 to match your system 
4. Modify the resolution and refresh rates that you desire
5. Save changes
6. Execute: cp config ~/.config/sway/ 
7. Execute: cp config /etc/sway
8. Optional: playback-video-2-indendent-displays.sh expects Gstreamer to be installed already. If another video player like VLC is desired open playback-video-2-indendent-displays.sh and modify to use your video player of choice. 
9. Reboot
10. At the login prompt click your user name. In the bottom right hand corner click the icon which appears as gear and choose Sway from the drop down.
11. Type your password in the login prompt to login
12. At this point you should see Sway on the Desktop

**GStreamer Installation Help**

If using GStreamer for the video playback 
1. Install GStreamer 
2. Install GStreamer VAAPI plugins: apt install gstreamer1.0-vaapi
3. export GST_VAAPI_ALL_DRIVERS=1 or add this permanently in the _~/.bashrc_ profile (append at end)
4. Verify the command : gst-inspect-1.0 vaapi returns vaapih264dec and vaapih265dec

**Verify Hardware Accelerated Decode during playback**

1. Install intel_gpu_top via sudo apt install intel-gpu-tools
2. Run : sudo intel_gpu_top

**Running the POC**

1. Open a terminal using Windows Key + Enter on the keyboard
2. Execute: ./playback-video-2-indendent-displays.sh myvideo1.mp4 myvideo2.mp4
3. Both videos will playback on their assigned workspaces e.g. displays.
4. Note that the playback-video-2-independent-displays.sh is setup for H264 files only. 
