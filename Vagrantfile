# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.network "private_network", type: "dhcp"

  # CI/CD
    config.vm.define "jenkins" do |jenkins|
      jenkins.vm.box = "ubuntu/focal64"
      jenkins.vm.hostname = "jenkins"
      jenkins.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
      end
      jenkins.vm.network "private_network"
      jenkins.vm.network :forwarded_port, guest: 8000, host: 8000
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

        cd /vagrant/jenkins
        docker build -t area51-jcasc .
        docker run -d --name jenkins -p 8000:8000 area51-jcasc
      SHELL
    end

  #
  #config.vm.define "defect-dojo" do |dojo|
  #  dojo.vm.box = "ubuntu/focal64"
  #  dojo.vm.hostname = "ansible-master"
  #  dojo.vm.network "private_network", ip: "192.168.33.10"
  #  dojo.vm.provider "virtualbox" do |vb|
  #    vb.memory = "2048"
  #    vb.cpus = 2
  #  end
  #  dojo.vm.provision "shell", inline: <<-SHELL
  #    sudo apt update
  #    sudo apt install -y ansible
  #  SHELL
  #end

end
