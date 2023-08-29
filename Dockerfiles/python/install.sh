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
    image_tag=skrjtech/python:$IMAGEOS-python$ver
    echo $image_tag
    docker buildx build --platform linux/amd64,linux/arm64 -t $image_tag --build-arg IMAGE_TAG=$IMAGEOS:latest --build-arg PYTHON_VERSION=$ver --push . 
    # docker push $image_tag
done