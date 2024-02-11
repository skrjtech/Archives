#!/bin/bash

# ROS INSTALL
sudo apt update && sudo apt upgrade -y
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu buster main" > /etc/apt/sources.list.d/ros-noetic.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential cmake
sudo rosdep init
rosdep update
mkdir ~/.ros_catkin_ws
cd ~/.ros_catkin_ws

rosinstall_generator ros_comm --rosdistro noetic --deps --wet-only --tar > noetic-ros_comm-wet.rosinstall
wstool init src noetic-ros_comm-wet.rosinstall
rosdep install -y --from-paths src --ignore-src --rosdistro noetic -r --os=debian:buster
sudo src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/noetic -j1 -DPYTHON_EXECUTABLE=/usr/bin/python3
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# ROS PACK
sudo apt install -y ros-${ROS_DISTRO}-uvc-camera
sudo apt install -y ros-${ROS_DISTRO}-usb-cam ros-${ROS_DISTRO}-image-view libcanberra-gtk*
sudo apt install -y ros-${ROS_DISTRO}-image-transport ros-${ROS_DISTRO}-image-transport-plugins
sudo apt install -y ros-${ROS_DISTRO}-rqt ros-${ROS_DISTRO}-rqt-common-plugins
sudo apt install -y ros-noetic-cv-bridge

# PIGPIO
cd ~
sudo apt install -y wget
sudo apt install -y python-setuptools python3-setuptools
wget https://github.com/joan2937/pigpio/archive/master.zip
unzip master.zip
mv pigpio-master .pigpio-master
cd .pigpio-master
make
sudo make install
cd ~
rm -f master.zip

# OPENCV INSTALL
# パッケージ管理ツールの更新（apt-getでインストールをするときは必ず行います。）
sudo apt -y update
sudo apt -y upgrade

# Githubのページを参考にライブラリをダウンロード
# 開発ツール
sudo apt -yV install build-essential
sudo apt -yV install cmake
# 行列演算
sudo apt -yV install libeigen3-dev
# GUIフレームワーク関連
sudo apt -yV install libgtk-3-dev
sudo apt -yV install qt5-default
sudo apt -yV install libvtk7-qt-dev
sudo apt -yV install freeglut3-dev
# 並列処理関連
sudo apt -yV install libtbb-dev
# 画像フォーマット関連
sudo apt -yV install libjpeg-dev
sudo apt -yV install libopenjp2-7-dev
sudo apt -yV install libpng++-dev
sudo apt -yV install libtiff-dev
sudo apt -yV install libopenexr-dev
sudo apt -yV install libwebp-dev
# 動画像関連
sudo apt -yV install libavresample-dev
# その他
sudo apt -yV install libhdf5-dev
# Python関連
sudo apt -yV install libpython3-dev
sudo apt -yV install python3-numpy python3-scipy python3-matplotlib

# gitのインストール（ソースをダウンロードするときに使います。）
sudo apt -y install git

# ソースのダウンロード
cd /usr/local
sudo mkdir opencv4
cd /usr/local/opencv4
sudo git clone https://github.com/opencv/opencv.git
sudo git clone https://github.com/opencv/opencv_contrib.git

# ビルド用のディレクトリ作成（buildディレクトリを作成してその中でビルドするのがお作法です。）
cd opencv
sudo mkdir build
cd build

# ビルド
# 基本的にはOpenCV公式ページを参考にしました。
sudo cmake \
-D CMAKE_BUILD_TYPE=Release \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D OPENCV_EXTRA_MODULES_PATH=/usr/local/opencv4/opencv_contrib/modules \
PYTHON3_EXECUTABLE=/usr/lib/python3.7 \
PYTHON_INCLUDE_DIR=/usr/include/python3.7 \
PYTHON_INCLUDE_DIR2=/usr/include/arm-linux-gnueabihf/python3.7m \
PYTHON_LIBRARY=/usr/lib/arm-linux-gnueabihf/libpython3.7m.so \
PYTHON3_NUMPY_INCLUDE_DIRS =/usr/lib/python3/dist-packages/numpy/core/include \
-S /usr/local/opencv4/opencv

sudo make -j7
sudo make install
