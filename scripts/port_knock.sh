#!/bin/bash
# simple port knocker
# usage: ./port_knock.sh <host> <port1> <port2> <port3>

HOST=$1
shift

for PORT in "$@"; do
    nc -z -w1 $HOST $PORT 2>/dev/null
    sleep 0.3
done

echo "[*] knock sequence complete"
