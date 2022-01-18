FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive 
ENV NODE_VERSION 16

RUN apt update -y &&\
    apt install -y \
        libedit-dev \
        aria2 \
        build-essential \
        curl \
        git \
        libbz2-dev \
        libffi-dev \
        liblzma-dev \
        libncurses5-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        llvm \
        make \
        tk-dev \
        wget \
        xz-utils \
        zlib1g-dev \
        software-properties-common

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash &&\
    . /root/.nvm/nvm.sh &&\
    nvm install $NODE_VERSION &&\
    nvm alias default $NODE_VERSION &&\
    nvm use default


ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN add-apt-repository ppa:deadsnakes/ppa &&\
    apt install -y python3.9 python3-pip &&\
    pip3 install pipenv

RUN curl -sL https://aws-amplify.github.io/amplify-cli/install | bash