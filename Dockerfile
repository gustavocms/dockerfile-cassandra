FROM ubuntu:precise

# Install pre-requisite packages
RUN apt-get install -y curl libjna-java

# Add Java 7 repo
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update

# Preemptively accept the Oracle License
RUN /bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# Install Java 7
RUN apt-get -y install oracle-java7-installer oracle-java7-set-default

# Install Cassandra
RUN echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/datastax.sources.list
RUN curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
RUN apt-get update
RUN apt-get install -y dsc20

EXPOSE 7199 7000 7001 9160 9042
