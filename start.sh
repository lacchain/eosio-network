#!/bin/bash
################################################################################
# LatamLink Testnet 
# https://github.com/LatamLink/testnet
###############################################################################

DATADIR="./blockchain-data"
mkdir -p $DATADIR

./stop.sh
echo -e "Starting Nodeos \n";

ulimit -n 65535
ulimit -s 64000

nodeos --data-dir $DATADIR --config-dir ./ "$@" > "./stdout.txt" 2> "./stderr.txt" &  echo $! > "./nodeos.pid"

echo -e "Check if node is running running 'tail -f stderr.txt' \n";
