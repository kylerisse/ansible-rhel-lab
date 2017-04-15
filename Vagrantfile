# -*- mode: ruby -*-
# vi: set ft=ruby :

boxes = {
  :cpu => "2",
  :mem => "2048",
  :diskmb => "100"
}

VROOT = File.dirname(File.expand_path(__FILE__))

Vagrant.configure("2") do |config|

  config.vm.define 'server' do |s|
    s.vm.box = "centos/7"
    s.vm.network "private_network", ip: "192.168.122.2"
    s.vm.network "private_network", ip: "192.168.200.22"
    s.vm.hostname = "server"

    diskname = "hd_server"
    file_to_disk1 = File.join(VROOT, "#{diskname}1.vdi")
    file_to_disk2 = File.join(VROOT, "#{diskname}2.vdi")
    file_to_disk3 = File.join(VROOT, "#{diskname}3.vdi")

    s.vm.provider "virtualbox" do |v|
      v.memory = boxes[:mem]
      v.cpus = boxes[:cpu]
      unless File.exist?(file_to_disk1)
        v.customize ["createhd",  "--filename", file_to_disk1, "--size", boxes[:diskmb]]
      end
      unless File.exist?(file_to_disk2)
        v.customize ["createhd",  "--filename", file_to_disk2, "--size", boxes[:diskmb]]
      end
      unless File.exist?(file_to_disk3)
        v.customize ["createhd",  "--filename", file_to_disk3, "--size", boxes[:diskmb]]
      end
      v.customize ["storageattach", :id, "--storagectl", "IDE", "--port", "0", "--device", "1", "--type", "hdd", "--medium", file_to_disk1]
      v.customize ["storageattach", :id, "--storagectl", "IDE", "--port", "1", "--device", "0", "--type", "hdd", "--medium", file_to_disk2]
      v.customize ["storageattach", :id, "--storagectl", "IDE", "--port", "1", "--device", "1", "--type", "hdd", "--medium", file_to_disk3]
    end

    s.vm.provision "shell", inline: <<-SHELL
      chcon --reference /etc/sysconfig/network-scripts/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth2
      ifup eth2
    SHELL
    s.vm.provision "shell", :path => "bootstrap.sh"
  end

  config.vm.define 'untrusted' do |u|
    u.vm.box = "centos/7"
    u.vm.network "private_network", ip: "192.168.122.50"
    u.vm.hostname = "untrusted"
    u.vm.provider "virtualbox" do |v|
      v.memory = boxes[:mem]
      v.cpus = boxes[:cpu]
    end
    u.vm.provision "shell", :path => "bootstrap.sh"
  end

  config.vm.define 'trusted' do |t|
    t.vm.box = "centos/7"
    t.vm.network "private_network", ip: "192.168.122.201"
    t.vm.hostname = "trusted"
    t.vm.provider "virtualbox" do |v|
      v.memory = boxes[:mem]
      v.cpus = boxes[:cpu]
    end
    t.vm.provision "shell", :path => "bootstrap.sh"
  end

  config.vm.define 'nfs' do |n|
    n.vm.box = "centos/7"
    n.vm.network "private_network", ip: "192.168.122.250"
    n.vm.hostname = "nfs"
    n.vm.provider "virtualbox" do |v|
      v.memory = boxes[:mem]
      v.cpus = boxes[:cpu]
    end

    n.vm.provision "shell", inline: <<-SHELL
      ifup eth1
    SHELL

    n.vm.provision "ansible" do |ansible|
      ansible.verbose = "vv"
      ansible.playbook = "nfs.yml"
      ansible.host_key_checking = false
    end

  end

end
