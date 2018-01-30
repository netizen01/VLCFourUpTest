## VLCFourUpTest

A simple swift macOS App to test playing multiple RTMP streams with libvlc.

Notes:

The VLC folder was pulled from the actual VLC.app, so this app needs to replicate the folder structure.


VLC Folder:
- include/vlc (Header files)
- lib (dynamic libraries and symlinks)
- plugins (duh)

The VLC.swift file manages the setup and creation of a the basics of libvlc (library, media player, media).

*You need to change the PluginPath at the top of VLC.swift*

App Setup:
- Add the 4 dylibs from VLC/lib to the General -> "Embedded Binaries" area in the Target Settings
- Add "libvlc.dylib" and "libvlccode.dylib" to the General -> "Linked Frameworks and Libraries" area in the Target Settings
- Add "$(PROJECT_DIR)/VLC/lib" to Build Settings -> Library Search Paths
- Add "$(SRCROOT)/VLC/include" to Build Settings -> Header Search Paths
- Add a Bridging Header to bring in the <vlc/vlc.h> framework
- Turn off "App Sandbox"


The ViewController has 4 NSViews (default settings in IB) with a click-gesture-recognizer in each one.

When you click a view, the media player attached to it starts playing.


Results:
- Playing 1 stream is fine.
- Sometimes you can get 2 streams to play.
- 3 streams will deadlock the app.
