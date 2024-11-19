# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 4
    end

  config.vm.define "devsecops" do |devsecops|
    devsecops.vm.box = "ubuntu/focal64"
    devsecops.vm.hostname = "defect-dojo"
    devsecops.vm.network "forwarded_port", guest: 80, host: 80
    devsecops.vm.provision "shell", inline: <<-SHELL
      chmod +x provision.sh
      ./provision.sh
      SHELL
    end

end
