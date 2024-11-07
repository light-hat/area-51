# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.network "private_network", type: "dhcp"

  config.vm.define "ansible-master" do |master|
    master.vm.box = "ubuntu/focal64"
    master.vm.hostname = "ansible-master"
    master.vm.network "private_network", ip: "192.168.33.10"
    master.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end
    master.vm.provision "shell", inline: <<-SHELL
      sudo apt update
      sudo apt install -y ansible
    SHELL
  end

  # CI/CD
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "ubuntu/focal64"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
    jenkins.vm.network "private_network", ip: "192.168.33.11"
  end

end
