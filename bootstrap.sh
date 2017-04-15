#!/bin/bash

echo "### vagrant ###

192.168.122.2 server.example.com server
192.168.122.50 untrusted.foo.io untrusted
192.168.122.50 trusted.example.com trusted
192.168.122.250 nfs.example.com nfs

192.168.200.22 www.public-site.com" >> /etc/hosts

chcon --reference /etc/sysconfig/network-scripts/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth1
ifup eth1
setenforce 1
systemctl enable firewalld.service
systemctl start firewalld.service
reboot
