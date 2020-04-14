ARG ARCH=amd64
ARG ELECTRUM_VERSION=3.3.8
ARG ELECTRUM_INSTALL_DIR=/opt/electrum

FROM $ARCH/python:3.7-alpine as builder

ARG ELECTRUM_VERSION
ARG ELECTRUM_INSTALL_DIR

RUN mkdir $ELECTRUM_INSTALL_DIR
WORKDIR $ELECTRUM_INSTALL_DIR

RUN apk update
RUN apk add --no-cache git
RUN git clone git://github.com/spesmilo/electrum.git $ELECTRUM_INSTALL_DIR
RUN git checkout $ELECTRUM_VERSION
RUN git submodule update --init
RUN apk add --no-cache gcc musl-dev python3-dev libffi-dev openssl-dev
RUN python3 -m pip install --user . cryptography

FROM $ARCH/python:3.7-alpine as ephemeral-electrum
LABEL maintainer="Luke Childs <lukechilds123@gmail.com>"

ARG ELECTRUM_INSTALL_DIR

COPY --from=builder $ELECTRUM_INSTALL_DIR $ELECTRUM_INSTALL_DIR
COPY --from=builder /root/.local /root/.local

RUN ln -s $ELECTRUM_INSTALL_DIR/run_electrum /usr/local/bin/electrum && \
  apk update && \
  apk add --no-cache git

WORKDIR /root

COPY entrypoint bip39toxprv /usr/local/bin/
ENTRYPOINT ["entrypoint"]
