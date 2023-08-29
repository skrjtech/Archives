#!/bin/bash
IMAGETAG=skrjtech/nordvpn:latest
docker buildx build --platform linux/amd64,linux/arm64 -t $IMAGETAG --push . 