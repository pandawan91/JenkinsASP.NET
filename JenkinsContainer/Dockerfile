#Dockerfile für Jenkins mit DNU

FROM jenkins:1.651.1

USER root
ENV DNX_VERSION 1.0.0-rc1-update1
ENV DNX_USER_HOME /opt/DNX_BRANCH
ENV DNX_RUNTIME_ID ubuntu.14.04-x64

RUN printf "deb http://ftp.us.debian.org/debian jessie main\n" >> /etc/apt/sources.list

RUN apt-get -qq update && apt-get -qqy install unzip curl libicu-dev libunwind8 gettext libssl-dev libcurl3-gnutls zlib1g  sqlite3 libsqlite3-dev && rm -rf /var/lib/apt/lists/*

# install dnvm and dnx
RUN curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_USER_HOME=$DNX_USER_HOME DNX_BRANCH=v$DNX_VERSION sh
RUN bash -c "source $DNX_USER_HOME/dnvm/dnvm.sh \
	&& dnvm install $DNX_VERSION -alias default -r coreclr \
	&& dnvm alias default | xargs -i ln -s $DNX_USER_HOME/runtimes/{} $DNX_USER_HOME/runtimes/default"


ENV PATH $PATH:$DNX_USER_HOME/runtimes/default/bin

# passing plugin list 
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

# recommended: set user back to jenkins
USER jenkins

