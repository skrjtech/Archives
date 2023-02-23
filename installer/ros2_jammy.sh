#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt update && sudo apt install curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

wget https://github.com/ros2/ros2/releases/download/release-humble-20230213/ros2-humble-20230127-linux-jammy-amd64.tar.bz2

mkdir -p ~/ros2_crystal
mv ros2-humble-20230127-linux-jammy-amd64.tar.bz2 ~/ros2_crystal
cd ~/ros2_crystal
tar xf ~/Downloads/ros2-humble-20230127-linux-jammy-amd64.tar.bz2

sudo apt update
sudo apt install -y python-rosdep
sudo rosdep init # if already initialized you may continue
rosdep update

CHOOSE_ROS_DISTRO=crystal # or bouncy
rosdep install --from-paths ros2-linux/share --ignore-src --rosdistro $CHOOSE_ROS_DISTRO -y --skip-keys "console_bridge fastcdr fastrtps libopensplice67 libopensplice69 osrf_testing_tools_cpp poco_vendor rmw_connext_cpp rosidl_typesupport_connext_c rosidl_typesupport_connext_cpp rti-connext-dds-5.3.1 tinyxml_vendor tinyxml2_vendor urdfdom urdfdom_headers"

sudo apt install -y libpython3-dev

. ~/ros2_crystal/ros2-linux/setup.bash