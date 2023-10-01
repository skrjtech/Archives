# IAMGE TAG (debian or ubuntu)
ARG IMAGE_TAG
FROM ${IMAGE_TAG}

SHELL [ "/bin/bash", "-c" ]

# 応答無効
ENV DEBIAN_FRONTEND=noninteractive

# Python Version Args
ARG PYTHONVERSION

RUN apt update && apt upgrade -y
RUN apt-get update && apt-get upgrade -y
RUN apt install -y sudo git curl locales vim
RUN bash <(curl -sSL https://raw.githubusercontent.com/skrjtech/Archives/main/Installer/python.sh) ${PYTHONVERSION}

CMD [ "/bin/bash" ]