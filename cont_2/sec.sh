#!/bin/bash

while :; do
	T=$(date +%H:%M:%S)
	echo $T > /var/log/time.log
	sleep 5
done
