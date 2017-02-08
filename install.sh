#!/bin/bash

# 安装相关组件
echo "-->to be install components..."
yum install epel-release vim git curl ctags git gcc gcc-c++ make readline readline-devel readline-staticsud openssl openssl-devel openssl-static sqlite-devel bzip2-devel bzip2-libs wget patch cmake make net-tools htop tree iftop -y

# 安装pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# 设置环境变量
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /root/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> /root/.bashrc
echo 'eval "$(pyenv init -)"' >> /root/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> /root/.bashrc
# wget http://mirrors.sohu.com/python/3.5.2/Python-3.5.2.tar.xz  -P ~/.pyenv/cache
export PYTHON_CONFIGURE_OPTS="--enable-shared"
source /root/.bashrc && pyenv install 3.5.2
mkdir -p ~/.pip
echo -e '[global]\ntrusted-host = pypi.douban.com\nindex-url = http://pypi.douban.com/simple' > ~/.pip/pip.conf
## 创建虚拟环境
/root/.pyenv/bin/pyenv virtualenv 3.5.2 py3
cd /home && echo 'py3' >> .python-version
#/root/.pyenv/versions/3.5.2/envs/py3/bin/pip install pylint
/root/.pyenv/versions/3.5.2/envs/py3/bin/pip install flake8

# 复制vimrc到家目录
# echo "-->move vimrc to location..."
# cp -f vimrc ~/.vimrc

# 用vundle管理vim插件
echo "-->download vundle to manage vim plugins..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# 安装vim插件
echo "-->install vim plugins..."
vim -c PluginInstall -c q -c q
cd /root/.vim/bundle/YouCompleteMe/ && /root/.pyenv/versions/3.5.2/bin/python3 install.py --clang-complete

echo "-->hello..."

