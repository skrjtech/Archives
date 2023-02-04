#!/bin/bash
sudo apt update && sudo apt upgrade
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker ${USER}

LATEST=v2.15.0
URL=https://github.com/docker/compose/releases/download/$LATEST/docker-compose-linux-aarch64
OUTPUT_PATH=/usr/local/lib/docker/cli-plugins
sudo mkdir -p $OUTPUT_PATH
OUTPUT_PATH=$OUTPUT_PATH/docker-compose
sudo curl -SL $URL -o $OUTPUT_PATH
sudo chown $USER:$USER $OUTPUT_PATH
sudo chmod 777 $OUTPUT_PATH