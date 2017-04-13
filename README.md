# Ansible Playbook for creating a RHEL7 lab

This repo contains an Ansible playbook as well as a Vagrantfile which will assist in studying for RHEL7 based tests such as RHCSA and RHCE.

## Ansible

This playbook has the following features:

* SElinux enabled
* Libvirt functional
* HTTPD installed
* CentOS ISO downloaded and contents served via HTTPD, for network based installations

Using the playbook you should be able to take a single build of CentOS (or any other EL in theory) and turn it into a lab similar to what Michael Jang defines in his book(s). It provides a smart starting point which can be used to quickly roll out KVM based VMs and practice.

### Playbook Usage

* Do a clean install of CentOS and verify ssh as root via network
* Insert IP in the hosts file located in this directory
* Run playbook via run.sh

## Vagrant

This repo also contains a vagrant environment for those that want to get up and running fast and don't need to play with libvirt. The vagrant envrionment has the following features:

* Builds 3 Centos7 VMs named server, untrusted, and trusted

Server VM has additional features:
* 3 additional HDs for playing with disk level tech such as LVM, (f|g)disk, encryption, etc.
* additional IP interface to test routing and firewalling

### Vagrant Usage

* vagrant up

All 3 VMs should be up and ready to go. vagrant status to verify.
