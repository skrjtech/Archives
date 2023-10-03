# Docker Remote GUI
DockerコンテナのアプリケーションGUIの表示について解説する．

★以下の手順でうまく行かない場合は，とりあえずReboot!! <ー Server/Client含めて

# 目次
- [Call Host To Container](#call-host-to-container)
- [Call Docker Container from Client Remote](#call-docker-container-from-client-remote)


# Call Host To Container 
★ Host <------> Docker Container  
ホストPCからDockerコンテナのGUIを呼び出す方法として以下の手順で実現可能  
ヒント:「　X11　」「　xhost　」 <ー 調べるといい

[Dockerfile]
```
FROM ubuntu:latest
# パッケージ管理ツールのアップデート
RUN apt update && apt upgrade -y
# パッケージ管理ツールのアップデート　※使わないがクセでいつもやっている
RUN apt-get update && apt-get upgrade -y
# GUIの表示用サンプルアプリ
RUN apt install -y x11-apps

CMD [ "/bin/bash" ]
```

上記にSourceをDockerfile名のファイルに保存

Dockerfile情報の構築
```
docker build -t x11-apps-img .
```

ホスト側のGUI表示の許可 (ターミナル上で実行)
```
xhost local:+
```

イメージの呼び出し (ターミナル上で実行)
```
docker run --rm -d \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
           x11-apps-img \
           /bin/bash -c "xeyes"
```

ギョロギョロの目が表示されましたら成功！

ポイント:  
- -e DISPLAY=$DISPLAY  
- -v /tmp/.X11-unix:/tmp/.X11-unix:rw

# Call Docker Container from Client Remote
Client <----> Server <----> Container
クライアントからサーバー内のコンテナのGUIを呼び出す方法として以下の手順で実現可能 

sshによるログイン
```
# 「-X」 or 「-Y」 でも問題は無いんだけど私の場合では「-XY」としている
ssh -XY serverhost@serverip
```

適当なところにディレクトリを作って移動，下記の内容のDockerfileを作成  
[Dockerfile (Server Side)]
```
FROM ubuntu:latest
# パッケージ管理ツールのアップデート
RUN apt update && apt upgrade -y
# パッケージ管理ツールのアップデート　※使わないがクセでいつもやっている
RUN apt-get update && apt-get upgrade -y
# GUIの表示用サンプルアプリ
RUN apt install -y x11-apps

CMD [ "/bin/bash" ]
```

Dockerfile情報の構築
```
docker build -t x11-apps-img .
```

コンテナを起動
```
docker run --rm -d \
            --net host \
            -e DISPLAY=$DISPLAY \
            -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
            --mount type=bind,src=$HOME/.Xauthority,dst=/root/.Xauthority.copy \
            x11-apps-img /bin/bash -c \
            "cp /root/.Xauthority.copy /root/.Xauthority; chown root:root /root/.Xauthority; xeyes"
```

ギョロギョロの目が表示されましたら成功！

ポイント:  
 - --net host  
 - --mount type=bind,src=$HOME/.Xauthority,dst=/root/.Xauthority.copy  
 「.Xauthority」は確かsshによるログインで生成される  
- .Xauthorityの権限はコンテナ情報権限に変更する必要がある