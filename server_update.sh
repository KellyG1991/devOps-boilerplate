#!/bin/bash

# update server
sudo apt update

# install necessary server packages
# install nginx to map the server
# install certbot to add certification and security to server
# install python3-certbot-nginx for automation with certbot and nginx mapping
sudo apt install nginx certbot python3-certbot-nginx


# install docker and docker-compose for containerization
# install Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io

# install Docker-Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# install git
sudo apt install git


# Add any necessary packages you would need