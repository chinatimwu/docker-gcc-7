FROM nvidia/cuda:9.1-devel-ubuntu17.04

RUN sed -i -e 's#archive.ubuntu.com#old-releases.ubuntu.com#g' /etc/apt/sources.list \
  && sed -i -e 's#security.ubuntu.com#old-releases.ubuntu.com#g' /etc/apt/sources.list \
  && apt-get update && apt-get install --no-install-recommends -y software-properties-common \
  && add-apt-repository ppa:ubuntu-toolchain-r/test \
  && apt-get update && apt-get install -y --no-install-recommends \
       gcc-7 \
       g++-7 \
       gcc \
       make \
 && echo "done apt-get gcc-7"


RUN rm -f /etc/apt/sources.list.d/ubuntu-toolchain-r-ubuntu-test-xenial.list* \
  && echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list \
  && apt-get update && apt-get install -y --no-install-recommends \
  libcudnn7=$CUDNN_VERSION-1+cuda9.0 \
  libcudnn7-dev=$CUDNN_VERSION-1+cuda9.0 \
  autoconf \
  automake \
  bison \
  bzip2 \
  cython \
  cmake \
  curl \
  flex \
  git \
  gfortran \
  libboost-log-dev \
  libboost-regex-dev \
  libboost-test-dev \
  libboost-program-options-dev \
  libc-dev \
  libevent-dev \
  libfreeimage-dev \
  libgflags-dev \
  libgoogle-glog-dev \
  libjpeg-dev \
  libpng-dev \
  libprotobuf-dev \
  liblapacke-dev \
  liblapack-dev \
  libsqlite3-dev \
  libstdc++6 \
  libssl-dev \
  libtool \
  libopenblas-dev \
  nlohmann-json-dev \
  make \
  openssh-client \
  protobuf-c-compiler \
  protobuf-compiler \
  pkg-config \
  wget \
  unzip \
  nasm \
&& apt-get clean -y \
&& apt-get purge -y \
&& apt-get autoremove -y \
&& rm -rf /var/lib/apt/lists/* 
