#!/usr/bin/env bash

sudo kvm -hda p2p-tube_ws.qcow2 -m 512 -smp 2 -vnc :1 -daemonize -net nic,macaddr=52:54:00:12:34:51 -net tap,ifname=tap1,script=no,downscript=no
sudo kvm -hda p2p-tube_tracker.qcow2 -m 128 -smp 1 -vnc :4 -daemonize -net nic,macaddr=52:54:00:12:34:54 -net tap,ifname=tap4,script=no,downscript=no

# CIS machines
sudo kvm -hda p2p-tube_cis_01.qcow2 -m 512 -smp 2 -vnc :2 -daemonize -net nic,macaddr=52:54:00:12:34:52 -net tap,ifname=tap2,script=no,downscript=no
sudo kvm -hda p2p-tube_cis_02.qcow2 -m 512 -smp 2 -vnc :3 -daemonize -net nic,macaddr=52:54:00:12:34:53 -net tap,ifname=tap3,script=no,downscript=no
