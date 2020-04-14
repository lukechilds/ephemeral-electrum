# ephemeral-electrum

[![Actions Status](https://badgen.net/github/checks/lukechilds/ephemeral-electrum?icon=github&label=Build%20Status)](https://github.com/lukechilds/ephemeral-electrum/actions)
[![Docker Pulls](https://badgen.net/docker/pulls/lukechilds/ephemeral-electrum?icon=docker&label=Docker%20pulls)](https://hub.docker.com/r/lukechilds/ephemeral-electrum/)
[![Docker Image Size](https://badgen.net/docker/size/lukechilds/ephemeral-electrum/latest/amd64?icon=docker&label=lukechilds/ephemeral-electrum)](https://hub.docker.com/r/lukechilds/ephemeral-electrum/tags)
[![GitHub Donate](https://badgen.net/badge/GitHub/Sponsor/D959A7?icon=github)](https://github.com/sponsors/lukechilds)
[![Bitcoin Donate](https://badgen.net/badge/Bitcoin/Donate/F19537?icon=bitcoin)](https://blockstream.info/address/3Luke2qRn5iLj4NiFrvLBu2jaEj7JeMR6w)
[![Lightning Donate](https://badgen.net/badge/Lightning/Donate/F6BC41?icon=bitcoin-lightning)](https://tippin.me/@lukechilds?refurl=github.com/lukechilds/ephemeral-electrum)

> A quick throwaway text based Electrum instance.

Handy for quickly checking the state of a given hierarchical deterministic wallet. Supports importing Electrum and BIP39 mnemonic seed phrases as well as extend public and private keys.

It's like a muggle friendly [Magical Bitcoin Wallet](https://github.com/MagicalBitcoin/magical-bitcoin-wallet).

## Usage

```
seed="much bottom such hurt hunt welcome cushion erosion pulse admit name deer"
docker run -it lukechilds/ephemeral-electrum "$seed"
```

You can also specify a single Electrum server to connect to:

```
docker run -it lukechilds/ephemeral-electrum "$seed" bitcoin.lukechilds.co:50002:s
```

You can pass in a seed phrase, xpub or xprv. The following all open the same wallet:

```
seed="much bottom such hurt hunt welcome cushion erosion pulse admit name deer"
docker run -it lukechilds/ephemeral-electrum "$seed"

xprv="zprvAcMRAFo3MYezabw3DuoGtZW4gFsgejCzVBT6mM7dd5TrhN5QSfrEjYcn4ZurjAoBT2ocLY7bH1bLpYKdrg1EbF3FtZjBCC6WPGVWqi7yJyc"
docker run -it lukechilds/ephemeral-electrum "$xprv"

xpub="zpub6qLmZmKwBvDHo61WKwLHFhSoEHiB4BvqrQNhZjXFBQzqaAQYzDAVHLwFusoTFSwai8ZpR3uKEaYMo34nWiJhJ1v4sbusJRHMSLd3hMZUmcp"
docker run -it lukechilds/ephemeral-electrum "$xpub"
```

## Build

Build this image yourself by checking out this repo, `cd` ing into it and running:

```
docker build -t lukechilds/ephemeral-electrum .
```

## License

MIT © Luke Childs