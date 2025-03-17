#!/bin/sh

HOST_NAME=$1
#echo $HOST_NAME
#echo $(python3 -c 'import socket; print( socket.gethostbyname("${HOST_NAME}"))')

ping -q -c 1 -t 1 $HOST_NAME | grep PING | sed -e "s/).*//" | sed -e "s/.*(//"
