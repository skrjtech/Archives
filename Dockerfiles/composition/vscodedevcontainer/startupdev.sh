#!/bin/bash

bash <(curl -OL https://github.com/skrjtech/archives/raw/main/dockertprojects/composition/vscodedevcontainer/devcontainer.zip)
unzip devcontainer.zip
rm -f devcontainer.zip