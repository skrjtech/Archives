ARG IMAGE_TAG
FROM $IMAGE_TAG

SHELL [ "/bin/bash", "-c" ]

# Update
RUN apt update && apt -y upgrade
RUN apt-get update && apt-get -y upgrade
RUN apt install -y sudo git

# Python Install
ARG PYTHON_VERSION
RUN git clone https://github.com/skrjtech/linux-setup.git
RUN . linux-setup/installer/python.sh $PYTHON_VERSION
RUN rm -rf linux-setup

ENV PATH /usr/local/python/bin:$PATH

CMD [ "/bin/bash" ]