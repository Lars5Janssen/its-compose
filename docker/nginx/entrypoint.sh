#!/bin/bash
seconds_to_live=$2
nginx
tcpdump -w "/tcpdumpinfo/tcpdump.$(date).$1.pcap" -G $seconds_to_live -W 1
while true; 
do sleep 1; sleep 1; done
