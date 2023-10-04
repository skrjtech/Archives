# Docker SSH Connect
Dockerコンテナに直接アクセスしたいときが，訪れてくるであろう...  
私にはその時が訪れました．

# sshでDockerコンテナにログイン
Client <----> Server <----> Container  

クライアントからサーバー内のコンテナのSSHにログインする方法として以下の手順で実現可能

[ホストにログイン]
``` bash
# 「-X」 or 「-Y」 でも問題は無いんだけど私の場合では「-XY」としている
ssh -XY serverhost@serverip
```

適当なところにディレクトリを作って移動，下記の内容のDockerfileを作成  
[Dockerfile (Server Side)]

``` Dockerfile
FROM ubuntu:latest
# パッケージ管理ツールのアップデート
RUN apt update && apt upgrade -y
# パッケージ管理ツールのアップデート　※　使わないがクセでいつもやっている
RUN apt-get update && apt-get upgrade -y
# GUIの表示用サンプルアプリ
RUN apt install -y x11-apps
# sshのサーバー用ツールをインストール
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
# 公開キー格納用に作成
RUN mkdir /root/.ssh && chmod 700 /root/.ssh
# 公開キーでを指定する為，実際この動作はいらないけど入れておく
RUN echo 'root:main' | chpasswd　
# rootにログインできるようにする．　※ 本来はおすすめはしませんが，仮想環境かつテスト用なので今はこれでいく．
RUN sed -i -e 's|^#PermitRootLogin prohibit-password|PermitRootLogin yes|g' /etc/ssh/sshd_config
# 公開キーでログイン可能に！
RUN sed -i -e 's|^#PubkeyAuthentication yes|PubkeyAuthentication yes|g' /etc/ssh/sshd_config
# 公開キーのファイル名を指定
RUN sed -i -e 's|^#AuthorizedKeysFile	.ssh/authorized_keys .ssh/authorized_keys2|AuthorizedKeysFile	.ssh/authorized_keys .ssh/authorized_keys2|g' /etc/ssh/sshd_config
# パスワードによるログインを無効
RUN sed -i -e 's|^#PasswordAuthentication yes|PasswordAuthentication no|g' /etc/ssh/sshd_config
# ポートを22に設定 ※ デフォルトで22になっているから本来は不要
EXPOSE 22

CMD [ "/bin/bash" ]
```

Dockerfile情報の構築
``` bash
docker build -t ssh-server-img .
```

公開キーの発行
``` bash
ssh-keygen
# pubkey名のファイルを作成
# Generating public/private rsa key pair.
# Enter file in which to save the key (/home/jtech/.ssh/id_rsa): pubkey
# あとはエンター連打で終わらす
```

pubkeyへの権限付与
``` bash
sudo chmod 700 pubkey*
```

コンテナを起動（--rmで消さずに起動）
``` bash
docker run -itd \
            -p 5050:22 \
            --name ssh-cont \
            -e DISPLAY=$DISPLAY \
            -v ./pubkey.pub:/root/.ssh/authorized_keys.copy \
            -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
            --mount type=bind,src=$HOME/.Xauthority,dst=/root/.Xauthority.copy \
            ssh-server-img /bin/bash -c "cp /root/.Xauthority.copy /root/.Xauthority; chown root:root /root/.Xauthority; cp /root/.ssh/authorized_keys.copy /root/.ssh/authorized_keys; chmod 700 -R /root/.ssh; service ssh restart; bash"
            
```                 

サーバー側からコンテナにsshでログイン
``` bash
ssh -i pubkey　-p 5050 root@docker_network_ip # DockerコンテナのIPアドレスは「docker inspect ssh-cont | grep IPAddress」で探せる
```