# Docker Container

```BASH
mkdir ./.devcontainer && tourch ./.devcontainer/devcontainer.json
mkdir ./.docker && tourch ./.docker/Dockerfile && tourch ./.docker/docker-compose.yml
```

```JSON
{
	"name": "<プロジェクト名>",
	"dockerComposeFile": "<保存先コンテナファイル>",
	"service": "<docker-compose.ymlで指定したサービス名>",
	"workspaceFolder": "<作業スペース>",
	"customizations": {
		"vscode": {
            # 追加機能の役割
		}
	}
}
```

```JSON
{
	"name": "",
	"dockerComposeFile": "../.docker/docker-compose.yml",
	"service": "",
	"workspaceFolder": "/Worckspace",
	"customizations": {
		"vscode": {
		}
	}
}
```

```Dockerfile
ARG IMAGES
FROM $IMAGES

# 応答無効
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y
RUN apt-get update && apt-get upgrade -y
```

``` Dockerfile
# TAB補完 コマンドオプション版？
RUN apt install -y bash-completion && source /etc/bash_completion  && echo "source /etc/bash_completion" >> ~/.bashrc 
```

```Dockerfile
ARG GID 1000
ARG UID 1000
ARG USERNAME HOGE
RUN groupadd -g $GID -o $USERNAME && \
    useradd -m -u $UID -g $GID -G sudo -o -s /bin/bash $USERNAME && echo "$USERNAME:$USERNAME" | chpasswd && \
    usermod --shell /bin/bash $USERNAME && \
    # sudo を　パスワードなしで実行
    usermod -aG sudo $USERNAME && \ 
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME && \
    usermod --uid $UID $USERNAME && groupmod --gid $GID $USERNAME
```

```YAML
version: "3.9"

services:
  ctrader:
    build:
      args:
        USERNAME: HOGE
        GID: 1000
        UID: 1000
      context: .
      dockerfile: ./.docker/Dockerfile
    image: skrjtech/...
```
```YAML
tty: True
restart: always
```
```YAML
hostname: ...
```
```YAML
environment:
    - ENV=ENV_VAL
```
```YAML
deploy:
  resources:
  reservations:
    devices:
    - driver: nvidia
      count: 1
      capabilities: [gpu]
```