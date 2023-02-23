#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y lsb-release gpg
export DEBIAN_FRONTEND=noninteractive
sudo -E apt update 
sudo apt install -y curl
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo -E apt install -y ros-melodic-desktop-full
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source /opt/ros/melodic/setup.bash
sudo -E apt install -y python-pip python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-catkin-tools
sudo rm -f /etc/ros/rosdep/sources.list.d/20-default.list
sudo rosdep init
rosdep update
