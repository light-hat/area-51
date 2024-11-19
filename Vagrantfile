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
    devsecops.vm.network "forwarded_port", guest: 9000, host: 9000
    devsecops.vm.network "forwarded_port", guest: 8080, host: 8080
    devsecops.vm.provision "shell", inline: <<-SHELL
      sudo apt update

      apt-get install -y \
                ca-certificates \
                curl \
                gnupg \
                lsb-release

      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
      echo \
          "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
          $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

      sudo apt-get update

      sudo apt-get install -y docker-ce docker-ce-cli containerd.io

      sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -sL https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d'"' -f4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose

      docker pull python:3.10
      docker pull zaproxy/zap-stable:latest

      cd /vagrant/jenkins && docker compose up -d --build

      sysctl -w vm.max_map_count=262144
      cd /vagrant/sonarqube && docker compose up -d --build
      SHELL
    end

end
