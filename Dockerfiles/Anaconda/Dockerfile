#
# DockerでAnaconda3を使用するよりPythonの仮想環境を推奨？推薦？する
#
FROM debian:latest

SHELL [ "/bin/bash", "-c" ]

# 応答無効
ENV DEBIAN_FRONTEND=noninteractive

# Update
RUN apt update && apt -y upgrade
RUN apt-get update && apt-get -u upgrade
RUN apt install -y sudo git 

ARG ANACONDA3_VERSION 
RUN git clone https://github.com/skrjtech/linux-setup.git && \
    . linux-setup/installer/anaconda3.sh $ANACONDA3_VERSION && \
    rm -rf linux-setup

CMD [ "/bin/bash" ]