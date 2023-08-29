#!/bin/bash

for ver in ${PYTHON_VERSIONS[@]}
do  
    image_tag=skrjtech/python:$IMAGEOS-python$ver
    echo $image_tag
    docker buildx build --platform linux/amd64,linux/arm64 -t $image_tag --build-arg IMAGE_TAG=$IMAGEOS:latest --build-arg PYTHON_VERSION=$ver --push . 
    # docker push $image_tag
done