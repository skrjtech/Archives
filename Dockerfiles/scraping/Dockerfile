ARG IMAGE_TAG
FROM $IMAGE_TAG

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

ENV PATH /usr/local/python/bin:$PATH

# Scraping
RUN python -m pip install requests \
                          selenium \
                          requests-html \
                          beautifulsoup4 \
                          webdriver-manager

# 画像処理用
RUN apt install -y ffmpeg

COPY build.sh /build.sh
RUN . build.sh

CMD [ "/bin/bash" ]