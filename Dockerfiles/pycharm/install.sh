#!/bin/bash
IMAGETAG=skrjtech/pycharm:debian
docker buildx build --platform linux/amd64,linux/arm64 -t $IMAGETAG --push . 