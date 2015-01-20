# RDJython docker file
FROM ubuntu:14.04
MAINTAINER Anthony Bradley <anthony.richard.bradley@gmail.com>
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update
RUN apt-get install -y build-essential python-dev python-numpy git python-setuptools vim flex bison cmake libboost-dev openbabel libboost-python-dev libboost-regex-dev python-pip nginx libjpeg8 libjpeg62-dev libfreetype6 libfreetype6-dev unzip jython swig wget
RUN mkdir /RDKit
RUN cd /RDKit; \
git clone https://github.com/rdkit/rdkit.git
COPY bashfile /root/.bashrc
RUN source /root/.bashrc; \mkdir -p $RDBASE/External/java_lib; \
wget http://search.maven.org/remotecontent?filepath=junit/junit/4.12/junit-4.12.jar -O $RDBASE/External/java_lib/junit.jar
COPY make_rdkit /make_rdkit.bash
RUN bash /make_rdkit.bash
