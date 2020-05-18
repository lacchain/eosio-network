<p align="center">
	<a href="https://latamlink.io">
		<img src="https://raw.githubusercontent.com/LatamLink/latamlink.io/master/logo.png" >
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

EOSIO version tag: `v2.0.4` 

Chain ID: `2c1f36d2e3774cba3e47804b6463c207544ac24183194e0b96ffad31e8f4acd5`

Genesis File: [`genesis.json`](genesis.json)

## 1. Install EOSIO from precompiled binaries   

Download the latest version of EOSIO for your OS from:  https://github.com/EOSIO/eos/releases/tag/v2.0.4   

For example, for ubuntu 18.04 you need to download `eosio_2.0.4-1-ubuntu-18.04_amd64.deb`  

You can use apt to install it:  
```
apt install ./eosio_2.0.4-1-ubuntu-18.04_amd64.deb   
```
It will download all dependencies and install EOSIO to `/usr/opt/eosio/v2.0.4`  


## 2. Configure LatamLink Testnet Node  

```
mkdir ~/LatamLink-testnet
cd ~/LatamLink-testnet
git clone https://github.com/LatamLink/testnet.git ./
```

- Edit `config.ini`   
  - Enter your server's external address: `p2p-server-address = YOUR_DOMAIN_OR_IP:9876` 

- Open TCP Ports (8888, 9876) on your firewall/router  

**Specify a genesis.json file the first time you run nodeos**  
```
./start.sh --delete-all-blocks --genesis-json genesis.json
```  
Follow logs to check your node is running OK. 

```
tail -f stderr.txt
```

Check if you can access your node using link `http://**YOUR_SERVER**/v1/chain/get_info` 

Here is an <a href="https://latamlink.eosio.cr/v1/chain/get_info" target="_blank">API Example</a>  

### Starting and Stoping Nodeos

- `./start.sh` Starts and restarts Nodeos service.

- `./stop.sh` Performs graceful shutdown of Nodeos service.

## P2P List

`boot.testnet.latamlink.io:9876`

`latamlink.eosio.cr:9876`

## API Endpoints

**HTTP RPC:** [https://latamlink.eosio.cr](https://latamlink.eosio.cr/v1/chain/get_info)

**GraphQL:** http://dfuse.testnet.latamlink.io/graphiql/

## Block Explorer

Block explorer located at http://explorer.testnet.latamlink.io

## Network Monitor

Network Monitor: https://monitor.latamlink.io/  

## Community Support
Visit the documentation website http://latamlink.io/docs/eosio

Join our <a target="_blank" href="https://t.me/">Telegram channel</a>
