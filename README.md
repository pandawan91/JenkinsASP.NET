# JenkinsASP.NET work in progress
Docker Container Setup for CI for ASP.NET WebApps with Jenkins on Ubuntu 14.04

To start the setup, execute the init.sh. This will install and setup your ubuntu environment and will start 
directly Jenkins, which will be available on Port 8080.

The Jenkins-container will be packed with dnx and dnvm to build asp.net application and have all plugins
installed where you need.

In Jenkins configure the ssh host to your system. This is needed to access to the docker daemon (little workaround).

Configure a new Job, add git-repo and add a Shell-Script-Buildstep and paste "dnu restore" and "dnu build ." to build 
the src.

Inside src-folder add a Dockerfile to build your asp.net container with jenkins and add a post-build step over ssh plugin to 
start docker daemon.

Start script as user because with root access the jenkins homefolder setup will fail 
