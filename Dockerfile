FROM phusion/baseimage:0.9.22

CMD ["/sbin/my_init"]

MAINTAINER Ryan Moore <ryan.moore@greyrocksoft.com>

RUN apt-get update -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update -y
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install oracle-java8-installer -y
RUN apt-get install git -y
# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
