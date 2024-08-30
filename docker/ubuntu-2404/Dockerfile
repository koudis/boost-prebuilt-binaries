FROM ubuntu:24.04

WORKDIR /root

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get upgrade -y && \
	DEBIAN_FRONTEND="noninteractive" apt-get -y install git p7zip-full wget build-essential make libssl-dev python3 python3-pip libopenmpi-dev curl && \
	curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
	DEBIAN_FRONTEND="noninteractive" apt-get -y install git-lfs && \
	git lfs install && \
	rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/Kitware/CMake/releases/download/v3.30.2/cmake-3.30.2-Linux-x86_64.sh && \
    chmod +x cmake-3.30.2-Linux-x86_64.sh && \
    ./cmake-3.30.2-Linux-x86_64.sh --skip-license --prefix=/usr/local
