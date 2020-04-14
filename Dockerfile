ARG ARCH=amd64
ARG ELECTRUM_VERSION=3.3.8
ARG ELECTRUM_INSTALL_DIR=/opt/electrum

FROM $ARCH/python:3.7-slim-buster as builder

ARG ELECTRUM_VERSION
ARG ELECTRUM_INSTALL_DIR

RUN mkdir $ELECTRUM_INSTALL_DIR
WORKDIR $ELECTRUM_INSTALL_DIR

RUN apt-get update
RUN apt-get install -y git
RUN git clone git://github.com/spesmilo/electrum.git $ELECTRUM_INSTALL_DIR
RUN git checkout $ELECTRUM_VERSION
RUN git submodule update --init
RUN apt-get install -y build-essential libssl-dev libffi-dev python3-dev
RUN python3 -m pip install --user . cryptography

FROM $ARCH/python:3.7-slim-buster as ephemeral-electrum

ARG ELECTRUM_INSTALL_DIR

COPY --from=builder $ELECTRUM_INSTALL_DIR $ELECTRUM_INSTALL_DIR
COPY --from=builder /root/.local /root/.local

RUN ln -s $ELECTRUM_INSTALL_DIR/run_electrum /usr/local/bin/electrum && \
  apt-get update && \
  apt-get install -y libsecp256k1-0 && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root

COPY entrypoint bip39toxprv /usr/local/bin/
ENTRYPOINT ["entrypoint"]
