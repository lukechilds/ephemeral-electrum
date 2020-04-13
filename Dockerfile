FROM python:3.7-slim-buster

ARG ELECTRUM_VERSION=3.3.8

RUN apt-get update

RUN apt-get install -y git
RUN git clone git://github.com/spesmilo/electrum.git

WORKDIR electrum

RUN git checkout $ELECTRUM_VERSION
RUN git submodule update --init
RUN apt-get install -y libsecp256k1-0
RUN python3 -m pip install --user . cryptography

