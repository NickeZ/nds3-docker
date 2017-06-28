FROM ubuntu:trusty

WORKDIR /root

RUN apt-get update -qq && apt-get install -qq git cmake build-essential vim libreadline-dev wget
RUN wget -q https://www.aps.anl.gov/epics/download/base/base-3.15.5.tar.gz
RUN tar xf base-3.15.5.tar.gz && cd base-3.15.5 && make -s
RUN wget -q https://www.aps.anl.gov/epics/download/modules/asyn4-31.tar.gz
RUN tar xf asyn4-31.tar.gz && cd asyn4-31 && echo EPICS_BASE=/root/base-3.15.5 > configure/RELEASE && make -s
RUN git clone -q https://github.com/cosylab/nds3
RUN git clone -q https://github.com/cosylab/nds3_epics

RUN echo "EPICS_BASE=/root/base-3.15.5\nASYN=/root/asyn4-31" > nds3_epics/configure/RELEASE.local

RUN echo '#!/bin/bash\nmkdir nds3/build nds3/build-examples && cd nds3/build && cmake ../CMake && make install && cd ../build-examples && cmake ../doc/examples/CMake && make install' > install_nds3 && chmod +x install_nds3
