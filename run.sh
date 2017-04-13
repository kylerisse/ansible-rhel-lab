#!/bin/bash

ansible-playbook -vv --inventory-file=hosts --extra-vars=vars.yml \
  --flush-cache -u root -k rhel-lab.yml
