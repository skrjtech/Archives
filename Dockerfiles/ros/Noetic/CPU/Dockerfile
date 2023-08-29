FROM skrjtech/ros:noetic_base

# Update
RUN apt update && apt -y upgrade
RUN apt-get update && apt-get -y upgrade
# RUN apt install -y sudo curl git tmux

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

ENV USERNAME noetic
RUN useradd -m $USERNAME && echo "$USERNAME:$USERNAME" | chpasswd && \
    usermod --shell /bin/bash $USERNAME && \
    usermod -aG sudo $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME && \
    usermod  --uid 1000 $USERNAME && groupmod --gid 1000 $USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME

CMD [ "/bin/bash" ]