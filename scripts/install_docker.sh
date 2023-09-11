
# Pre-requisites
sudo apt-get update && 
    sudo apt-get upgrade -y &&
    sudo apt-get install ca-certificates curl gnupg


# Install keyrings
sudo install -m 0755 -d /etc/apt/keyrings &&
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg &&
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Install docker
sudo apt-get update &&
    sudo apt-get install docker-ce docker-ce-cli containerd.io