ARG IMAGE_TAG
FROM $IMAGE_TAG
# Update
RUN apt update && apt -y upgrade
RUN apt-get update && apt-get -u upgrade
#labelme
RUN apt-get install -y python3-pyqt5 libxcb-xinerama0
RUN python -m pip install pyqt5 
RUN python -m pip install opencv-python-headless
RUN python -m pip install labelme pycocotools
RUN ln -s /usr/local/python/bin/labelme /usr/bin/labelme
RUN git clone https://github.com/wkentaro/labelme.git
CMD [ "/bin/bash" ]