# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # CI/CD
    config.vm.define "jenkins" do |jenkins|
      jenkins.vm.box = "ubuntu/focal64"
      jenkins.vm.hostname = "jenkins"
      jenkins.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
      end
      jenkins.vm.network "private_network", ip: "192.168.133.10"
      jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
      jenkins.vm.provision "shell", inline: <<-SHELL
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

        cd /vagrant/jenkins
        docker-compose up -d --build
      SHELL
    end

  #config.vm.define "defect-dojo" do |dojo|
  #  dojo.vm.box = "ubuntu/focal64"
  #  dojo.vm.hostname = "ansible-master"
  #  dojo.vm.network "private_network", ip: "192.168.133.11"
  #  dojo.vm.provider "virtualbox" do |vb|
  #    vb.memory = "2048"
  #    vb.cpus = 2
  #  end
  #  dojo.vm.provision "shell", inline: <<-SHELL
  #    sudo apt update

  #    apt-get install -y \
  #              ca-certificates \
  #              curl \
  #              gnupg \
  #              lsb-release

  #    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  #    echo \
  #        "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  #        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

  #    sudo apt-get update

  #    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

  #    sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -sL https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d'"' -f4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  #    sudo chmod +x /usr/local/bin/docker-compose
  #  SHELL
  #end

end
