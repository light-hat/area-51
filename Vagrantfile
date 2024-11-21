# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "devsecops" do |devsecops|
    devsecops.vm.box = "ubuntu/focal64"
    devsecops.vm.hostname = "devsecops-vm"
    devsecops.vm.network "private_network", ip: "192.168.56.10"
    devsecops.vm.network "forwarded_port", guest: 80, host: 80

    config.vm.provider "virtualbox" do |vb|
        vb.memory = 4096
        vb.cpus = 4
    end

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

  config.vm.define "sandbox" do |sandbox|
      sandbox.vm.box = "ubuntu/focal64"
      sandbox.vm.hostname = "sandbox"
      sandbox.vm.network "private_network", ip: "192.168.56.20"
      #sandbox.vm.network "forwarded_port", guest: 9000, host: 9000

      sandbox.vm.synced_folder ".", "/vagrant", disabled: true

      sandbox.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
      end

      sandbox.vm.provision "shell", inline: <<-SHELL
        apt-get update
        apt-get install -y docker.io
        docker volume create portainer_data
        docker run -d -p 9000:9000 --name portainer \
            -v /var/run/docker.sock:/var/run/docker.sock \
            -v portainer_data:/data \
            portainer/portainer-ce
      SHELL
  end

end
