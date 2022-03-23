#!/bin/sh
# kill dhcp client for eth0
if [ -f /var/run/udhcpc.eth0.pid ]; then
kill `cat /var/run/udhcpc.eth0.pid`
sleep 0.1
fi
# configure interface eth0
ifconfig eth0 192.168.0.1 netmask 255.255.255.0 broadcast 192.168.0.255 up
route add default gw 192.168.0.254
echo nameserver 192.168.0.254 >> /etc/resolv.conf