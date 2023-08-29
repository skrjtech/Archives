#!/bin/bash

ANACONDA3_VERSION=$1
wget -P /tmp/anaconda3.sh https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh 
. /tmp/anaconda3.sh -b -p /tmp/anaconda3                
rm /tmp/anaconda3.sh
echo "export PYTHONDONTWRITEBYTECODE=1" >> ~/.bashrc

export PATH=/tmp/anaconda3/bin:$PATH
export CONDA_DEFAULT_ENV base
conda update -n base -c defaults conda