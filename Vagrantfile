# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.network "private_network", ip: "192.168.33.10"

  # CI/CD
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "ubuntu/focal64"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "private_network", ip: "192.168.33.11"
  end

  # Defect Dojo
  config.vm.define "dojo" do |dojo|
    dojo.vm.box = "ubuntu/focal64"
    dojo.vm.hostname = "dojo"
    dojo.vm.network "private_network", ip: "192.168.33.12"
  end

  # Nexus
  config.vm.define "storage" do |storage|
    storage.vm.box = "ubuntu/focal64"
    storage.vm.hostname = "storage"
    storage.vm.network "private_network", ip: "192.168.33.13"
  end
end