<p align="center">
	<a href="https://eosio.lacchain.net">
   		<img src="./lacchain-eosio-logo.png" width="500">
   	</a>
</p>
<p align="center">
	<a href="https://git.io/col">
		<img src="https://img.shields.io/badge/%E2%9C%93-collaborative_etiquette-brightgreen.svg" alt="Collaborative Etiquette">
	</a>
	<a href="#">
		<img src="https://img.shields.io/dub/l/vibe-d.svg" alt="MIT">
	</a>
</p>

# LACChain EOSIO Node Installation

Testnet Chain ID: `5821525c6588037e2b066b992fcac34909a5b7f1ea8d5a393f6720fca3750d61`

Testnet Genesis File: [`genesis.json`](genesis.json)

## 1. Install EOSIO from precompiled binaries 

EOSIO version tag: `v2.0.12`

Download the latest version of EOSIO for your OS from:  https://github.com/EOSIO/eos/releases/tag/v2.0.12

For example, for ubuntu 18.04 you need to download `eosio_2.0.12-1-ubuntu-18.04_amd64.deb`

You can use apt to install it:  
```
apt install ./eosio_2.0.12-1-ubuntu-18.04_amd64.deb
```
It will download all dependencies and install EOSIO to `/usr/opt/eosio/v2.0.12`


## 2. Configure LACChain EOSIO Node  

```
mkdir ~/eosio-testnet
cd ~/eosio-testnet
git clone https://github.com/lacchain/eosio-network ./
```

- Edit `config.ini` depending on your node type based on the sample config files provided  
  - Enter your server's external address: `p2p-server-address = YOUR_DOMAIN_OR_IP:9876` 

- Open TCP Ports 80/443, 9876) on your firewall/router  

### Sample config.ini files

- Validator Node: [validator-config.ini](./validator-config.ini)
- Boot Node: [boot-config.ini](./boot-config.ini)
- Writer Node: [writer-config.ini](./writer-config.ini)
- Observer Node: [observer-config.ini](./observer-config.ini)

### Writer middleware for RPC API 

The LACchain governance model requires that every transaction include two signatures, the user that originates the transaction and the writer node that allocates the required network resources to execute the transaction. The entity operating the writer node is responsible for the transaction.

This requirement is met by running the following HTTP service as a proxy to the writer node RPC API endpoint. 
[Writer node RPC API middleware](https://github.com/lacchain/eosio-writer-middleware)

## 3. Start your node

**Specify a genesis.json file the first time you run nodeos**  

```
./start.sh --delete-all-blocks --genesis-json genesis.json
```  
Follow logs to check your node is running OK. 

```
tail -f stderr.txt
```

Check if you can access your node using link `http://**YOUR_SERVER**/v1/chain/get_info` 

Here is an <a href="https://lacchain.eosio.cr/v1/chain/get_info" target="_blank">API Example</a>  

### Starting and Stopping Nodeos

- `./start.sh` Starts and restarts Nodeos service.

- `./stop.sh` Performs graceful shutdown of Nodeos service.

# P2P List

For an updated list of Peers and their public keys visit : https://lacchain.eosio.online/nodes 

- `observer.eosio.cr:9873`
- `writer.eosio.cr:9872`
- `boot.eosio.cr:9871`
- `wrt1.testnet.lacchain.eosargentina.io:9875`
- `obs1.testnet.lacchain.eosargentina.io:9873`

# API Endpoints

**HTTP RPC:** 
- [https://lacchain.eosio.cr](https://lacchain.eosio.cr/v1/chain/get_info)
- [http://wrt1.testnet.lacchain.eosargentina.io](http://wrt1.testnet.lacchain.eosargentina.io/v1/chain/get_info)

# Network Monitor

Network Monitor: [**lacchain.eosio.online**](https://lacchain.eosio.online)

# Block Explorer

Block explorer located at [**eosio-explorer.lacchain.net**](https://eosio-explorer.lacchain.net/)

# Community Support
Visit the LAChain EOSIO [**documentation website**](https://eosio.lacchain.net)

Join our <a target="_blank" href="https://t.me/lacchaineosio">Telegram channel</a>


## About EOSIO

EOSIO is an open-source software that enables communities to launch highly configurable blockchain networks on which developers and entrepreneurs can run very performant applications. [EOSIO](https://eos.io/) was created in 2018 and is maintained by [Block One](https://block.one/). Learn more about the [EOSIO protocol for LACChain](https://eosio.lacchain.net/en/docs/eosio) at the project's documentation site.