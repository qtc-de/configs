#!/bin/bash

if [ $# -ne 1 ]; then
        echo "$0 <INF>"
        exit 1
fi

MATCHES=$(ip l | grep -E '^[0-9]{1,2}: ' | cut -f2 -d":" | grep $1)
if [ "$MATCHES" == "" ]; then
        echo -n "%{F#536b80}down%{F-}"
        exit 0
fi

IP=$(ip -4 addr show $1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

if [ "$IP" == "" ]; then 
        echo -n "%{F#536b80}down%{F-}"
        exit 0
fi

echo -n "%{F#5d87bf}$IP%{F-}"
