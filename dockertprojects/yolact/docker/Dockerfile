FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

SHELL [ "/bin/bash", "-c" ]

# Update
RUN apt update && apt -y upgrade
RUN apt-get update && apt-get -u upgrade
RUN apt install -y sudo git curl wget
RUN apt install -y xz-utils zlib1g-dev zip

# Python Install
ENV PYTHON_VERSION=3.7.16
RUN set -x && \
    DEBIAN_FRONTEND=noninteractive apt install -y curl make cmake tk-dev xz-utils uuid-dev libdb-dev libssl-dev zlib1g-dev libbz2-dev libffi-dev \
                    libgdbm-dev liblzma-dev libsqlite3-dev build-essential libreadline-dev libncursesw5-dev && \
    curl -O https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz && \
    tar xJf Python-$PYTHON_VERSION.tar.xz && \                                                        
    rm -rf Python-$PYTHON_VERSION.tar.xz && \                                                   
    cd Python-$PYTHON_VERSION && \                                                    
    ./configure --prefix=/usr/local/python --with-ensurepip && \
    make  && \                                 
    make install  && \
    cd ../  && \
    rm -rf Python-$PYTHON_VERSION && \
    ln -s /usr/local/python/bin/python3 /usr/local/python/bin/python && \
    ln -s /usr/local/python/bin/pip3 /usr/local/python/bin/pip  && \
    export PATH=/usr/local/python/bin:$PATH && \
    echo "export PATH=${PATH}" >> ~/.bashrc && \
    echo 'export PYTHONDONTWRITEBYTECODE=1' >> ~/.bashrc && \
    source ~/.bashrc && \
    # PIP UPDATE
    python3 -m pip install --upgrade pip setuptools && \
    set +x

ENV PATH /usr/local/python/bin:$PATH

# YOLACT 
RUN git clone https://github.com/dbolya/yolact.git
RUN pip install torch==1.0.1 torchvision -f https://download.pytorch.org/whl/torch_stable.html

# これ入れないとopencvが正常に作動しない
RUN apt install -y libgl1-mesa-dev

# 画像処理機能 opencv camera 用
RUN python -m pip install cython pycocotools pillow==6.2.2 PyQt5 matplotlib opencv-python opencv-contrib-python
RUN echo 'export QT_X11_NO_MITSHM=1' >> ~/.bashrc
COPY ./yolactWeightsDownload.sh /
RUN . yolactWeightsDownload.sh

CMD [ "/bin/bash" ]