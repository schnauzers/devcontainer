#!/bin/bash

# 安装相关组件 
yum install git curl

# 用vundle管理vim插件
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c PluginInstall &

echo "hello"

