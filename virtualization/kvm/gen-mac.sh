#!/bin/bash
# Generate a random MAC address for the qemu nic.
# Bibliography: http://www.linux-kvm.org/page/Networking

printf 'DE:AD:BE:EF:%02X:%02X\n' $((RANDOM%256)) $((RANDOM%256))
