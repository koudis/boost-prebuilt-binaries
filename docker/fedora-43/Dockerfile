FROM fedora:43

WORKDIR /root

RUN dnf update -y && \
    dnf install -y git p7zip wget gcc gcc-c++ make openssl-devel python3 python3-pip python3-devel openmpi-devel curl coreutils && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | bash && \
    dnf install -y git-lfs && \
    git lfs install && \
    dnf clean all

RUN wget https://github.com/Kitware/CMake/releases/download/v3.30.2/cmake-3.30.2-Linux-x86_64.sh && \
    chmod +x cmake-3.30.2-Linux-x86_64.sh && \
    ./cmake-3.30.2-Linux-x86_64.sh --skip-license --prefix=/usr/local