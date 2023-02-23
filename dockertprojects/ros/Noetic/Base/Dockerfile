FROM ubuntu:20.04

SHELL [ "/bin/bash", "-c" ]

# Update
RUN apt update && apt -y upgrade
RUN apt-get update && apt-get -y upgrade
RUN apt install -y sudo curl git tmux

RUN bash <(curl -sSL https://raw.githubusercontent.com/skrjtech/rosBeginner/main/installer/RosVersion1/noetic_version.sh)

CMD [ "/bin/bash" ]