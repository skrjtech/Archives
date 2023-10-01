ARG IMAGE_TAG
FROM ${IMAGE_TAG}

SHELL [ "/bin/bash", "-c" ]

# 応答無効
ENV DEBIAN_FRONTEND=noninteractive

# 必要パッケージ
RUN apt update && apt -y upgrade
RUN apt-get update && apt-get -y upgrade
RUN apt install -y sudo git curl locales

# Pycharm Version
ARG PYCHARMVERSION
RUN bash <(curl -sSL https://raw.githubusercontent.com/skrjtech/linux-setup/main/installer/pycharm.sh) ${PYCHARMVERSION}

CMD [ "/bin/bash" ]