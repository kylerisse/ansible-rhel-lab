# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"

  config.vm.network "private_network", ip: "192.168.122.2"
  config.vm.network "private_network", ip: "192.168.100.2"

  config.vm.provision "shell", inline: <<-SHELL
    ifup eth1
    ifup eth2
  SHELL

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "vv"
    ansible.playbook = "rhel-lab.yml"
    ansible.inventory_path = "hosts_vagrant"
    ansible.limit = "all"
    ansible.host_key_checking = false
    ansible.extra_vars = "vars_vagrant.yml"
  end
end
