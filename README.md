<p align="center">
	<a href="https://latamlink.io">
		<img height="200" src="./latamlink-logo.svg" >
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

[LatamLink](https://latamlink.io) is a voluntary regional alliance led by Latin American technology companies interested in the development of the LACChain network ecosystem. The purpose of LatamLink is to offer an EOSIO-based testnet to highlight the benefits of this platform. LACChain is an initiative of BID Labs (part of the Inter-American Development Bank) whose purpose is to accompany and accelerate the development of the blockchain ecosystem in Latin America. 

LatamLink is led by:
- [EOS Argentina](https://www.eosargentina.io/)
- [EOS Costa Rica](https://eoscostarica.io/)
- [EOS Venezuela](https://eosvenezuela.io/)

# LatamLink Testnet Node Installation

EOSIO version tag: `v2.0.9`

Chain ID: `5821525c6588037e2b066b992fcac34909a5b7f1ea8d5a393f6720fca3750d61`

Genesis File: [`genesis.json`](genesis.json)

## 1. Install EOSIO from precompiled binaries   

Download the latest version of EOSIO for your OS from:  https://github.com/EOSIO/eos/releases/tag/v2.0.9

For example, for ubuntu 18.04 you need to download `eosio_2.0.9-1-ubuntu-18.04_amd64.deb`

You can use apt to install it:  
```
apt install ./eosio_2.0.9-1-ubuntu-18.04_amd64.deb
```
It will download all dependencies and install EOSIO to `/usr/opt/eosio/v2.0.9`


## 2. Configure LatamLink Testnet Node  

```
mkdir ~/LatamLink-testnet
cd ~/LatamLink-testnet
git clone https://github.com/LatamLink/testnet.git ./
```

- Edit `config.ini`   
  - Enter your server's external address: `p2p-server-address = YOUR_DOMAIN_OR_IP:9876` 

- Open TCP Ports (8888, 9876) on your firewall/router  

### Sample config.ini files

- Validator Node: [validator-config.ini](./validator-config.ini)
- Boot Node: [boot-config.ini](./boot-config.ini)
- Writer Node: [writer-config.ini](./writer-config.ini)
- Observer Node: [observer-config.ini](./observer-config.ini)

### Writer middleware for RPC API 

The LACchain governance model requires that every transaction include two signatures, the user that originates the transaction and the writer node that allocates the required network resources to execute the transaction. The entity operating the writer node is responsible for the transaction.

This requirement is met by running the following HTTP service as a proxy to the writer node RPC API endpoint. 
[Writer node RPC API middleware](https://github.com/LatamLink/writer-middleware)


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

## P2P List

For an updated list of Peers and their public keys visit : https://dashboard.latamlink.io/nodes 

`wrt1.testnet.lacchain.eosargentina.io:9875`
`obs1.testnet.lacchain.eosargentina.io:9873`
`observer.eosio.cr:9873`
`boot.eosio.cr:9871`

## API Endpoints

**HTTP RPC:** 
- [https://lacchain.eosio.cr](https://lacchain.eosio.cr/v1/chain/get_info)
- [http://wrt1.testnet.lacchain.eosargentina.io](http://wrt1.testnet.lacchain.eosargentina.io/v1/chain/get_info)

~~**GraphQL:** http://dfuse.testnet.latamlink.io/graphiql/~~
(not available)

## Block Explorer

~~Block explorer located at http://explorer.testnet.latamlink.io~~
(not available)

## Network Monitor

Network Monitor: https://dashboard.latamlink.io/

## Community Support
Visit the documentation website:  http://latamlink.io/docs/eosio

Join our <a target="_blank" href="https://t.me/latamlink">Telegram channel</a>
