#!/bin/bash

#install docker
sudo bash installDockerOnUbuntu14.04.sh

# install docker compose
sudo bash installDockerComposeOnUbuntu.sh

# install jenkins container
bash installJenkinsContainer.sh

# remove unnecessary packages
sudo apt-get -y autoremove

#install ssh
sudo apt-get update
sudo apt-get install -y ssh

echo install complete!!!
