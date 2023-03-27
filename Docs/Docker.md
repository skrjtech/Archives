# Docker 情報集
## docker 日本語入力
コンテナ内で日本語入力を行う為のDockerfile記述
### debianの場合
```
FROM debian:latest

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y locales
RUN locale-gen ja-JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:jp
ENV LC_ALL=ja_JP.UTF-8
```
### ubuntuの場合
```
FROM ubuntu

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
```
## タイムゾーン 設定
```
ENV TZ Asia/Tokyo
```
## GoogleChrome 起動時に必要な特権
コンテナを起動しようとした時に下記のエラーが起きたら
Failed to move to new namespace: PID namespaces supported, Network namespace supported, but failed: errno = Operation not permitted
コンテナに特権を付与することで解決 (root以外のユーザー)
```
docker run --privileged -v DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw <image:tag>
```
## Dockerでスクレイピング
GoogleChrome/Chromiumを使用するときはメモリシェアするべし
docker run --shm-size 1g
## リモートディスプレイ
(Main PC) <---> ( RaspberryPi <-> docker ) <---> (Container Display)
```
ssh -XY user@(IP:XXX.XXX.XXX.XXX)
```
Raspberry Pi
```
docker run --rm -it --name sample -e DISPLAY=$DISPLAY --net host -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/root/.Xauthority debian
```
Container 
```
apt update 
apt install -y x11-apps
xeyes
```
## マルチアーキテクチャのプッシュ方法
マルチアーキテクチャビルドを実行するために新規ビルダーを作成
```
docker buildx create --use --name multi-arch
```
multi-archドライバが inactive になっているので起動
```
docker buildx inspect --builder multi-arch --bootstrap
```
プッシュ方法
```
docker buildx build --platform linux/amd64,linux/arm64 -t IMAGE_TAG --push .
```