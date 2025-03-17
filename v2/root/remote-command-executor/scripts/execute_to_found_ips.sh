#!/bin/sh
IPS=$(arp -a | sed -En 's/.*\((.*)\).*/\1/p')
PORT=$1
for fn in $IPS; do
        ./execute.sh $fn $PORT
done

