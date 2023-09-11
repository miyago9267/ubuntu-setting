#!/bin/bash

# Install nginx
sudo curl --output /usr/share/keyrings/nginx-keyring.gpg  \
      https://unit.nginx.org/keys/nginx-keyring.gpg

echo deb [signed-by=/usr/share/keyrings/nginx-keyring.gpg] https://packages.nginx.org/unit/ubuntu/ kinetic unit | sudo tee /etc/apt/sources.list.d/nginx-stable.list
echo deb-src [signed-by=/usr/share/keyrings/nginx-keyring.gpg] https://packages.nginx.org/unit/ubuntu/ kinetic unit | sudo tee /etc/apt/sources.list.d/nginx-stable.list

sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install unit -qy nginx

# Create directories for ssl certs
sudo mkdir -p /etc/nginx/certs

# Copy configs
sudo echo $(cat ../configs/nginx/nginx.conf) > /etc/nginx/nginx.conf
sudo cp -r ../configs/nginx/domains ../configs/nginx/public /etc/nginx/

# Create user for nginx
sudo useradd nginx

# Create nginx service
sudo systemctl enable nginx
sudo systemctl restart nginx