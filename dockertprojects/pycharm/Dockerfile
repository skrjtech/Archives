FROM debian:latest

SHELL [ "/bin/bash", "-c" ]

RUN apt update && apt -y upgrade
RUN apt-get update && apt-get -y upgrade
RUN apt install -y sudo git curl locales

RUN locale-gen ja-JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:jp
ENV LC_ALL=ja_JP.UTF-8

RUN apt install -y fcitx-mozc fonts-noto-cjk
RUN im-config -n fcitx

ENV GTK_IM_MODULE=xim
ENV QT_IM_MODULE=fcitx
ENV XMODIFIERS=@im=fcitx
ENV DefalutIMModule=fcitx

RUN bash <(curl -sSL https://raw.githubusercontent.com/skrjtech/linux-setup/main/installer/pycharm.sh)

CMD [ "/bin/bash" ]