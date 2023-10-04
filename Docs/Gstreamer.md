# GStreamer Home
Docs link: <img src='https://gstreamer.freedesktop.org/documentation/assets/images/gstreamer-logo.svg' height=15/>[GStreamer](https://gstreamer.freedesktop.org/documentation/installing/for-android-development.html?gi-language=c)

# GSTreamer Tutorial 
## GSTreamer Install
Ubuntu 22.04

``` bash
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libglib2.0-doc libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio 
```

gstreamer1.0-doc (Ubuntu20.04以下とDebian(RSPi, Jetoson Nano)ではインストールしないこと)

``` bash
sudo apt-get install -y gstreamer1.0-doc
```

gst-launch-1.0 filesrc locations='動画保存先'

xvimagesink 表示画面出力
gst-launch-1.0 filesrc locations='動画保存先' | xvimagesink 

カメラを起動　表示　v4l2src  

``` bash
gst-launch-1.0 v4l2src ! xvimagesink
```

パイプラインを使用した 表示  

``` bash
gst-launch-1.0 v4l2src ! jpegdec ! xvimagesink
```
