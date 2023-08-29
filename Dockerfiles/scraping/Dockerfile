FROM ubuntu:latest

SHELL [ "/bin/bash", "-c" ]

# Update
RUN apt update && apt -y upgrade
RUN apt-get update && apt-get -u upgrade

# 文字化け対策
RUN apt install -y fonts-takao

# Language 
RUN apt-get install -y locales
RUN locale-gen ja-JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:jp
ENV LC_ALL=ja_JP.UTF-8

# Python & Pycharm Install
# RUN bash <(curl -sSL https://raw.githubusercontent.com/skrjtech/Archives/main/Installer/python.sh) 3.6.15
# RUN bash <(curl -sSL https://raw.githubusercontent.com/skrjtech/Archives/main/Installer/python.sh) 3.7.17
# RUN bash <(curl -sSL https://raw.githubusercontent.com/skrjtech/Archives/main/Installer/python.sh) 3.8.18
RUN bash <(curl -sSL https://raw.githubusercontent.com/skrjtech/Archives/main/Installer/python.sh) 3.9.18
# RUN bash <(curl -sSL https://raw.githubusercontent.com/skrjtech/Archives/main/Installer/python.sh) 3.10.13
# RUN bash <(curl -sSL https://raw.githubusercontent.com/skrjtech/Archives/main/Installer/python.sh) 3.11.5
# Pycharm Version Release look at link https://www.jetbrains.com/ja-jp/pycharm/download/other.html
RUN bash <(curl -sSL https://raw.githubusercontent.com/skrjtech/Archives/main/Installer/pycharm.sh) 2023.2.1

RUN python -m venv /scraping
RUN source /scraping/bin/activate

# pip update
RUN pip install --upgrade pip
# Scraping
RUN python -m pip install requests selenium requests-html beautifulsoup4 webdriver-manager
# 画像処理用
RUN apt install -y ffmpeg

COPY build.sh /build.sh
RUN . build.sh

CMD [ "/bin/bash" ]