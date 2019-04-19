#!/bin/bash

# 安装相关组件
echo "-->to be install components..."
yum install epel-release
yum install vim git curl ctags git gcc gcc-c++ make readline readline-devel readline-staticsud openssl openssl-devel openssl-static sqlite-devel bzip2-devel bzip2-libs wget patch cmake make net-tools htop tree iftop libffi-devel graphviz* -y

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

# 安装javascript语法检查
# 可以选择jshint或者eslint
npm install -g jshint
npm install -g eslint
cd /home
eslint --init
# 如果使用jshint，可以在项目中新建.jshintrc文件，内容如下：
#{
  #"esversion": 6,
  #"curly": true,
  #"eqeqeq": true,
  #"eqnull": true,
  #"expr": true,
  #"latedef": true,
  #"onevar": true,
  #"noarg": true,
  #"node": true,
  #"trailing": true,
  #"undef": true,
  #"unused": true
#}

# 如果使用eslint,修改如下配置
#    "env": {
        #"browser": true,
        #"es6": true,
		#"jquery": true
    #},
        #"indent": [
            #"error",
            #2

echo "-->finnished..."

