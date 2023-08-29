#!/bin/bash

# NORDTOKEN
# LOCALIP

# NORDVPN START
/etc/init.d/nordvpn start
sleep 5

nordvpn login --token $NORDVPN_TOKEN
nordvpn whitelist add subnet $(ip -4 a show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}\/(.\d+)')
nordvpn whitelist add subnet $(ip -4 a show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}\/(.\d+)')
nordvpn c
sleep 5

# LOCAL ETH0
IP=$(ip -4 a show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}\/(.\d+)' | sed -e 's/\//\\\//')
sed -ie "s/ETH0IP/${IP}/g" /etc/squid/squid.conf
# LOCAL WLAN0
IP=$(ip -4 a show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}\/(.\d+)' | sed -e 's/\//\\\//')
sed -ie "s/WLAN0IP/${IP}/g" /etc/squid/squid.conf
# NORDVPN
IP=$(ip -4 a show nordlynx | grep -oP '(?<=inet\s)\d+(\.\d+){3}\/(.\d+)' | sed -e 's/\//\\\//')
sed -ie "s/NORDVPNIP/${IP}/g" /etc/squid/squid.conf

# SQUID START
/etc/init.d/squid start