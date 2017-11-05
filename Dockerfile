#FROM ubuntu:16.04

FROM maxdocker/docker:1.3

MAINTAINER liang max_translia@126.com

USER root

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y apt-utils gcc make wget curl openssh-server git
RUN apt-get install -y python3.5 build-essential libssl-dev libevent-dev libjpeg-dev libxml2-dev libxslt-dev python-pip

RUN service ssh start

RUN mkdir /usr/local/redis /usr/local/mongodb /usr/local/java /usr/local/tomcat /usr/local/nodejs

ADD jdk-8u151-linux-x64.tar.gz /usr/local/java/

ADD apache-tomcat-7.0.82.tar.gz /usr/local/tomcat

ADD redis-4.0.2.tar.gz /usr/local/redis

ADD node-v8.6.0.tar.gz /root/

RUN cd /usr/local/redis/redis-4.0.2/src && make

RUN cd /root/node-v8.6.0 && ./configure --prefix=/usr/local/nodejs && make && make install

ENV JAVA_HOME /usr/local/java/jdk1.8.0_151/

ENV NODE_HOME /usr/local/nodejs

ENV PATH $JAVA_HOME/bin:$NODE_HOME/bin:$PATH

RUN java -version

RUN node -v

EXPOSE 8080 22

RUN /usr/local/tomcat/apache-tomcat-7.0.82/bin/startup.sh


#ENTRYPOINT /usr/local/tomcat/apache-tomcat-7.0.82/bin/startup.sh && tail -F /usr/local/tomcat/apache-tomcat-7.0.82/logs/catalina.out



#sudo docker run -it -p 8888:22 maxdocker/docker:1.4 /bin/bash