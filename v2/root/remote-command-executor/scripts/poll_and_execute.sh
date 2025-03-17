#!/bin/sh

#cd /root/remote-command-executor/scripts

HOST_NAME=$(cat ./hostname.txt)
./get_ip_from_hostname.sh $HOST_NAME > ip.txt
IP_ADDR=$(cat ./ip.txt)
PORT=$(cat ./port.txt)
SLEEP_TIME=30

while :; do
	echo "Checking for execution requests"
	#./execute.sh "$IP_ADDR" $PORT
        ./execute_to_found_ips.sh $PORT
	sleep $SLEEP_TIME
done
