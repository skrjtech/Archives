FROM nvidia/cuda:12.0.1-devel-ubuntu18.04

SHELL [ "/bin/bash", "-c" ]

# Update
RUN apt update && apt -y upgrade
RUN apt-get update && apt-get -y upgrade
RUN apt install -y sudo curl git tmux

RUN bash <(curl -sSL https://raw.githubusercontent.com/skrjtech/rosBeginner/main/installer/RosVersion1/melodic_version.sh)

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

ENV USERNAME melodic
RUN useradd -m $USERNAME && echo "$USERNAME:$USERNAME" | chpasswd && \
    usermod --shell /bin/bash $USERNAME && \
    usermod -aG sudo $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME && \
    usermod  --uid 1000 $USERNAME && groupmod --gid 1000 $USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME

RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

CMD [ "/bin/bash" ]