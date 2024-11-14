# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # DefectDojo
  config.vm.define "defect-dojo" do |dojo|
    dojo.vm.box = "ubuntu/focal64"
    dojo.vm.hostname = "defect-dojo"
    dojo.vm.network "private_network", ip: "192.168.133.10"
    dojo.vm.network "forwarded_port", guest: 8080, host: 8081
    dojo.vm.provider "hyperv" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
    dojo.vm.provision "shell", inline: <<-SHELL
      chmod +x provision.sh && ./provision.sh
        if [ ! -d "/home/vagrant/django-DefectDojo" ]; then
          git clone https://github.com/DefectDojo/django-DefectDojo.git /home/vagrant/django-DefectDojo
        fi
        cd /home/vagrant/django-DefectDojo
        sudo docker-compose up -d
      SHELL
    end

  # CI/CD
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "ubuntu/focal64"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.provider "hyperv" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
    jenkins.vm.network "private_network", ip: "192.168.133.11"
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
    jenkins.vm.provision "shell", inline: <<-SHELL
      chmod +x provision.sh && ./provision.sh
      cd /vagrant/jenkins
      docker-compose up -d --build
    SHELL
  end

  # Analysis
  config.vm.define "analysis" do |analysis|
    analysis.vm.box = "ubuntu/focal64"
    analysis.vm.hostname = "analysis"
    analysis.vm.provider "hyperv" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
    analysis.vm.network "private_network", ip: "192.168.133.12"
    analysis.vm.network "forwarded_port", guest: 8080, host: 8080
    analysis.vm.provision "shell", inline: <<-SHELL
      chmod +x provision.sh && ./provision.sh
      cd /vagrant/sonarqube
      docker-compose up -d --build
      cd /vagrant/dependency-track
      docker-compose up -d --build
    SHELL
  end
end
