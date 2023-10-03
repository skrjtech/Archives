# Docker Remote GUI
DockerコンテナのアプリケーションGUIの表示について解説する．

# 目次
- [Call Host To Container](./DockerRemoteGUI.md?plain=1#L8)


# Call Host To Container 
★ Host <------> Docker Container  
ホストPCからDockerコンテナのGUIを呼び出す方法として以下の手順で実現可能

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

イメージの呼び出し
```
docker run -d 
```

# Clientからの呼び出し