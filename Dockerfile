FROM docker.io/centos:7.3.1611

ADD ./install.sh /usr/local
ADD ./vimrc /root/.vimrc
ADD ./ycm_extra_conf.py /home/.ycm_extra_conf.py

RUN /usr/local/install.sh

