FROM ubuntu:latest

# Add repositories
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

# Preemptively accept the Oracle License
RUN /bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# Install Java 7
RUN apt-get -y install oracle-java7-installer oracle-java7-set-default
