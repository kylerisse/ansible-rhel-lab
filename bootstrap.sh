#!/bin/bash

echo "### vagrant ###

192.168.200.22 www.public-site.com
192.168.122.2 server.example.com
192.168.122.50 untrusted.foo.io
192.168.122.50 trusted.example.com" >> /etc/hosts

chcon --reference /etc/sysconfig/network-scripts/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth1
ifup eth1
setenforce 1
systemctl enable firewalld.service
systemctl start firewalld.service
reboot
