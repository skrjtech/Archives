#!/bin/bash
sudo apt update && sudo apt -y upgrade
sudo apt install -y wget
sudo apt install -y apt-transport-https ca-certificates wget software-properties-common
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install -y google-chrome-stable