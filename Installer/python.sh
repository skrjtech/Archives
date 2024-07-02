#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# PYTHON INSTALL
PYTHON_VERSION=$1

# sudo -E apt install -y tk-dev 
# sudo -E apt install -y curl make cmake 
# sudo -E apt install -y xz-utils uuid-dev libdb-dev libssl-dev zlib1g-dev libbz2-dev libffi-dev
# sudo -E apt install -y libgdbm-dev liblzma-dev libsqlite3-dev build-essential libreadline-dev libncursesw5-dev

# パッケージのインストールコマンド
install_cmd="apt install -y tk-dev curl make cmake xz-utils uuid-dev libdb-dev libssl-dev zlib1g-dev libbz2-dev libffi-dev libgdbm-dev liblzma-dev libsqlite3-dev build-essential libreadline-dev libncursesw5-dev"

# sudoが使用可能かどうかをチェック
if sudo -v > /dev/null 2>&1; then
    echo "sudo is available"
    sudo -E apt update
    sudo -E $install_cmd
else
    echo "sudo is not available"
    apt update
    $install_cmd
fi

curl -O https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz      
tar xJf Python-$PYTHON_VERSION.tar.xz                                                        
rm -rf Python-$PYTHON_VERSION.tar.xz                                                         
cd Python-$PYTHON_VERSION                                                                    
# ./configure --prefix=/usr/local/python --with-ensurepip
./configure --enable-optimizations --prefix=/usr/local/python
make -j8
sudo make install                                                                                 
cd ../                                                                                         
rm -rf Python-$PYTHON_VERSION

# echo 'export PYTHONDONTWRITEBYTECODE=1' >> ~/.bashrc
# echo 'export PATH=/usr/local/python/bin:$PATH' >> ~/.bashrc

ln -sf /usr/local/python/bin/python3 /usr/bin/python
ln -sf /usr/local/python/bin/pip3 /usr/bin/pip

# Python Priority Change
# update-alternatives --install /usr/local/python/bin/python3 python /usr/bin/python 1

source ~/.bashrc