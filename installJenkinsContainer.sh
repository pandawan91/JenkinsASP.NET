#!/bin/bash

NAME="budgetmanager/jenkins"
cd JenkinsContainer

# build custom jenkins container
sudo docker build -t $NAME .

cd ..

#make jenkins workspace 
mkdir jenkins
cd jenkins

# start the container
sudo docker run --name jenkins -d -p 8080:8080 -p 50000:50000 -v /$(pwd):/var/jenkins_home $NAME
