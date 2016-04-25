#!/bin/bash

NAME="aspnet/jenkins"
cd JenkinsContainer

# build custom jenkins container
sudo docker build -t $NAME .

#create folder where the container stores 
cd ..
mkdir jenkins_home
cd jenkins_home

# start the container
sudo docker run --name jenkins -d -p 8080:8080 -p 50000:50000 -v /$(pwd):/var/jenkins_home $NAME

echo JenkinsContainer ready!!!
