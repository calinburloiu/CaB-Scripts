#!/bin/bash

sudo brctl addbr br0
sudo brctl addif br0 eth0
sudo tunctl -u root -t tap0
sudo ip link set dev tap0 up
sudo brctl addif br0 tap0
sudo dhclient br0
