#!/bin/bash
# RUN AS ROOT, i.e. sudo ./init.sh
modprobe br_netfilter
echo "1" | tee /proc/sys/net/ipv4/ip_forward
echo "1" | tee /proc/sys/net/bridge/bridge-nf-call-iptables
systemctl start crio
kubeadm init --cri-socket /var/run/crio/crio.sock