P=/home/calinburloiu/Scripturi/CaB-Scripts/Virtualization/KVM

sudo brctl addbr br0
sudo brctl addif br0 eth0
sudo kvm -hda centos-clone.qcow2 -net nic,macaddr=$($P/gen-mac.sh) -net tap,script=$P/qemu-ifup
