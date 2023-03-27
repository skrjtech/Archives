#!/bin/bash

ROS_DISTRO=noetic

sudo apt update && sudo apt -y upgrade
sudo apt-get update && sudo apt-get -y upgrade

sudo rm -f /etc/ros/rosdep/sources.list.d/20-default.list
sudo rosdep init
rosdep update

# source /opt/ros/noetic/setup.bash
# sudo apt-get install python-wstool python-catkin-toolsmelodic
# catkin config --extend /opt/ros/$ROS_DISTRO

source /opt/ros/$ROS_DISTRO/setup.bash

if [ $ROS_DISTRO = "melodic" ]; then
    sudo apt-get install python-wstool python-catkin-tools
elif [ $ROS_DISTRO = "noetic" ]; then
    sudo apt install python3-osrf-pycommon python3-catkin-tools
fi

USER=/home/seed
CATKINWS=$USER/ros/$ROS_DISTRO
mkdir -p $CATKINWS/src
cd $CATKINWS/src
git clone https://github.com/seed-solutions/seed_smartactuator_sdk
git clone https://github.com/seed-solutions/seed_r7_ros_pkg.git
git clone https://github.com/seed-solutions/task_programmer.git
cd $CATKINWS
rosdep install -y -r --from-paths src --ignore-src
catkin build 
source $CATKINWS/devel/setup.bash

echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> $USER/.bashrc
echo "source ${CATKINWS}/devel/setup.bash" >> $USER/.bashrc
mkdir -p $CATKINWS/src/share
source $USER/.bashrc
sudo chown seed:seed -R $USER