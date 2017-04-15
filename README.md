# Ansible Playbook for creating a RHEL7 lab

This repo contains an Ansible playbook as well as a Vagrantfile which will assist in studying for RHEL7 based tests such as RHCSA and RHCE.

## Ansible

This playbook has the following features:

* Libvirt
* HTTPD
* CentOS ISO downloaded and contents served via httpd, for network based installations

Using the playbook you should be able to take a single build of CentOS (or any other EL in theory) on a physical system and turn it into a lab similar to what Michael Jang and Alessandro Orsaria define in their book(s). It provides a starting point which can be used to quickly roll out KVM based VMs and practice.

### Playbook Usage

* Do a clean install of CentOS and verify ssh as root via network
* Insert IP in the hosts file located in this directory
* Run playbook via run.sh

## Vagrant

This repo also contains a vagrant environment for those that want to get up and running fast and don't need to play with libvirt.

Builds 3 CentOS boxes
* server | 192.168.122.2 / 192.168.200.22 | server.example.com   
* untrusted | 192.168.122.50 | untrusted.foo.io   
* trusted | 192.168.122.201 | trusted.example.com   

Server VM has additional features:
* 3 additional HDs for playing with disk level tech such as LVM, (f|g)disk, encryption, etc.
* additional IP interface to test routing and firewalling

### Vagrant Usage

* vagrant up

All 3 VMs should be up and ready to go. To verify:

* vagrant status
