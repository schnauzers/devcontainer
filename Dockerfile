FROM docker.io/centos:7.3.1611

ADD ./install.sh /usr/local
ADD ./vimrc /root/.vimrc
RUN /usr/local/install.sh

