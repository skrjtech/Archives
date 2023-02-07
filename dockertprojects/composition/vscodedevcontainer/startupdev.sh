#!/bin/bash

current=$PWD

mkdir .devcontainer
mkdir .docker

cd .devcontainer
bash <(curl https://raw.githubusercontent.com/skrjtech/archives/main/dockertprojects/composition/vscodedevcontainer/.devcontainer/devcontainer.json)
cd ..
cd .docker
bash <(curl https://raw.githubusercontent.com/skrjtech/archives/main/dockertprojects/composition/vscodedevcontainer/.docker/Dockerfile)
bash <(curl https://raw.githubusercontent.com/skrjtech/archives/main/dockertprojects/composition/vscodedevcontainer/.docker/docker-compose.yml)

cd $current