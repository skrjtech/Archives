#!/bin/bash
sudo apt update && sudo apt -y upgrade
# java
sudo apt install -y default-jre
sudo apt install -y default-jdk

PYCHARM_VERSION=$1
# pycahrm
sudo apt-get install -y curl
curl -OL https://download.jetbrains.com/python/pycharm-community-$PYCHARM_VERSION.tar.gz
tar xzf pycharm-community-$PYCHARM_VERSION.tar.gz -C /tmp/
rm pycharm-community-$PYCHARM_VERSION.tar.gz
mv /tmp/pycharm-community-$PYCHARM_VERSION /tmp/pycharm
ln -s /tmp/pycharm/bin/pycharm.sh /tmp/pycharm/bin/pycharm
export PATH=/tmp/pycharm/bin:$PATH
echo "export PATH=${PATH}" >> ~/.bashrc