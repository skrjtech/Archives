#!/bin/bash
IMAGEOS=debian
PYTHON_VERSIONS=(
    3.11.1
    3.10.9
    3.9.16
    3.8.16
    3.7.16
    3.6.15
)
for ver in ${PYTHON_VERSIONS[@]}
do  
    TAG=$IMAGEOS-python$ver
   docker buildx build --platform linux/amd64,linux/arm64 -t skrjtech/scraping:$TAG --push . --build-arg IMAGE_TAG=skrjtech/python:$TAG
done