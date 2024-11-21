#!/bin/bash

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

NETWORK_NAME="devsecops_network"

if docker network inspect "$NETWORK_NAME" > /dev/null 2>&1; then
    echo "Network '$NETWORK_NAME' already exists."
else
    echo "The network '$NETWORK_NAME' does not exist. I am creating a network..."
    docker network create "$NETWORK_NAME"
    if [ $? -eq 0 ]; then
        echo "The network '$NETWORK_NAME' was created successfully."
    else
        echo "Error creating network '$NETWORK_NAME'."
        exit 1
    fi
fi

docker pull python:3.10
docker pull zaproxy/zap-stable:latest

cd /vagrant/jenkins && docker compose up -d --build

sysctl -w vm.max_map_count=262144
cd /vagrant/sonarqube && docker compose up -d --build

cd /vagrant/defectdojo && docker compose up -d --build

cd /vagrant/nexus && docker compose up -d --build

cd /vagrant/zap && docker compose up -d --build

sudo apt-get install -y nginx

cp -rf /vagrant/nginx/devsecops.conf /etc/nginx/sites-available/devsecops.conf

ln -fs /etc/nginx/sites-available/devsecops.conf /etc/nginx/sites-enabled/devsecops.conf

rm -f /etc/nginx/sites-enabled/default

systemctl restart nginx
