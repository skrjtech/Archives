#!/bin/bash
if [ $(dpkg --print-architecture) = "amd64" ]; then
    # Google Chrome Install
    git clone https://github.com/skrjtech/linux-setup.git
    . linux-setup/installer/googlechrome.sh
    rm -rf linux-setup
elif [$(dpkg --print-architecture) = "arm64" ]; then
    # Chromium And Driver
    sudo apt-get install -y chromium chromium-driver
fi
