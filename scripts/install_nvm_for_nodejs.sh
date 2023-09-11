#!/bin/bash

# Install nvm
sudo mkdir -p /usr/local/nvm
sudo curl -o- https://github.com/nvm-sh/nvm/blob/master/install.sh | NVM_DIR=/usr/local/nvm bash


# Install path
cat ../configs/rc/.nvmrc >> /etc/bash.bashrc