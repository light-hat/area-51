# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 4
    end

  config.vm.define "devsecops" do |devsecops|
    devsecops.vm.box = "ubuntu/focal64"
    devsecops.vm.hostname = "devsecops-vm"
    devsecops.vm.network "forwarded_port", guest: 80, host: 80

    config.vm.provision "shell", inline: <<-SHELL
        apt-get update
        apt-get install -y ansible
        ansible-galaxy collection install community.docker --force
      SHELL

    config.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "/vagrant/provision.yml"
        ansible.compatibility_mode = "2.0"
        ansible.install = false
      end

    end

end
