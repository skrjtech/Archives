FROM ubuntu:latest

SHELL [ "/bin/bash", "-c" ]

RUN apt-get update
RUN apt-get install -y language-pack-ja-base language-pack-ja fonts-noto-cjk fcitx-mozc
# RUN im-config -n fcitx

ENV GTK_IM_MODULE xim
ENV QT_IM_MODULE fcitx
ENV XMODIFIERS @im=fcitx
ENV DefalutIMModule=fcitx

RUN locale-gen ja_JP.UTF-8  
ENV LANG=ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8

ENV TZ Asia/Tokyo

ENV USERNAME=main
RUN useradd -m $USERNAME && echo "$USERNAME:$USERNAME" | chpasswd && \
    usermod --shell /bin/bash $USERNAME && \
    usermod -aG sudo $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME && \
    usermod  --uid 1000 $USERNAME && groupmod --gid 1000 $USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME

CMD [ "/bin/bash"]