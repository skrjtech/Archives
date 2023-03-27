FROM debian:latest

SHELL [ "/bin/bash", "-c" ]

# Update
RUN apt update && apt -y upgrade
RUN apt-get update && apt-get -u upgrade
RUN apt install -y sudo git 
# RUN set -x \
#     && apt install -y sudo              \
#                         git             \
#                         curl            \
#                         wget            \
#                         libxi6          \
#                         libxss1         \
#                         libxtst6        \
#                         libxrandr2      \
#                         libasound2      \ 
#                         libxcursor1     \
#                         libegl1-mesa    \
#                         libxcomposite1  \
#                         libgl1-mesa-glx \
#     && wget -P /opt https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh     \ 
#     && bash /opt/Anaconda3-2020.02-Linux-x86_64.sh -b -p /opt/anaconda3                     \
#     && rm /opt/Anaconda3-2020.02-Linux-x86_64.sh                                            \
#     && echo "export PATH=/opt/anaconda3/bin:$PATH" >> ~/.bashrc                             \
#     && echo "export PYTHONDONTWRITEBYTECODE=1" >> ~/.bashrc                                 \
#     && set +x

# ENV PATH /opt/anaconda3/bin:$PATH
# RUN conda update -n base -c defaults conda
# ENV CONDA_DEFAULT_ENV base
# if use env
# ENV PATH /opt/anaconda3/envs/${CONDA_DEFAULT_ENV}/bin:$PATH

ARG ANACONDA3_VERSION 
RUN git clone https://github.com/skrjtech/linux-setup.git && \
    . linux-setup/installer/anaconda3.sh $ANACONDA3_VERSION && \
    rm -rf linux-setup

CMD [ "/bin/bash" ]