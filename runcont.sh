#!/bin/bash
#$1: 代表要挂载的本地目录，挂载到容器中的/mnt目录下
docker run -d -v $1:/mnt/ docker.io/schnauzers/vim tail -f /dev/null

