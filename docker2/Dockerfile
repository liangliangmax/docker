FROM maxdocker/develop:1.0

MAINTAINER liang max_translia@126.com

USER root

RUN mkdir /usr/workspace/node

RUN cd /usr/workspace/node

RUN git clone https://github.com/liangliangmax/node_git.git

RUN npm install

RUN node app.js