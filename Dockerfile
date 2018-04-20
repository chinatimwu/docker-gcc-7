FROM nvidia/cuda:9.1-devel-ubuntu17.04

RUN sed -i -e 's#archive.ubuntu.com#old-releases.ubuntu.com#g' /etc/apt/sources.list \
  && sed -i -e 's#security.ubuntu.com#old-releases.ubuntu.com#g' /etc/apt/sources.list \
  && apt-get install --no-install-recommends -y software-properties-common \
  && add-apt-repository ppa:ubuntu-toolchain-r/test \
  && apt-get update && apt-get install -y --no-install-recommends \
       gcc-7 \
       g++-7 \
 && "done apt-get gcc-7"
