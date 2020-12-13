FROM ubuntu:18.04

WORKDIR /root

RUN apt-get update && \
    apt-get upgrade -y && \
	apt-get -y install git p7zip-full wget build-essential make libssl-dev python3 python3-pip libopenmpi-dev && \
	apt-get -y install libcurl4-openssl-dev gettext zlib1g-dev && \
	curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
	apt-get -y install git-lfs && \
	git lfs install && \
	rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/git/git/archive/v2.23.0.tar.gz -O git.tar.gz && \
	tar -xf git.tar.gz && \
	cd git-* && \
	make prefix=/usr/local all -j 4 && \
	make prefix=/usr/local install

RUN wget https://github.com/Kitware/CMake/releases/download/v3.18.5/cmake-3.18.5-Linux-x86_64.sh && \
    chmod +x cmake-3.18.5-Linux-x86_64.sh && \
    ./cmake-3.18.5-Linux-x86_64.sh --skip-license --prefix=/usr/local
