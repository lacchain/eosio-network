#!/bin/bash
################################################################################
# LatamLink Testnet 
# https://github.com/LatamLink/testnet
###############################################################################

    if [ -f "./nodeos.pid" ]; then
	pid=`cat "./nodeos.pid"`
	echo $pid
	kill $pid
	

	echo -ne "Stopping Nodeos \n"

        while true; do
            [ ! -d "/proc/$pid/fd" ] && break
            echo -ne "."
            sleep 1
        done
	rm -r "./nodeos.pid"
	
	DATE=$(date -d "now" +'%Y_%m_%d-%H_%M')
        if [ ! -d ./logs ]; then
            mkdir ./logs
        fi
        tar -pcvzf ./logs/stderr-$DATE.txt.tar.gz stderr.txt stdout.txt


        echo -ne "\rNodeos Stopped.    \n"
    fi