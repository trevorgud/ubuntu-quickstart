#!/usr/bin/env bash

# Run this script as unprivileged user, not sudo.

# download spark
wget https://apachemirror.wuchna.com/spark/spark-3.1.1/spark-3.1.1-bin-hadoop3.2.tgz
tar -xvzf ./spark-3.1.1-bin-hadoop3.2.tgz
mkdir -p ~/spark && mv ./spark-3.1.1-bin-hadoop3.2 ~/spark/
rm ./spark-3.1.1-bin-hadoop3.2.tgz

# download kafka
wget https://downloads.apache.org/kafka/2.8.0/kafka_2.12-2.8.0.tgz
tar -xvzf ./kafka_2.12-2.8.0.tgz
mkdir -p ~/kafka && mv ./kafka_2.12-2.8.0 ~/kafka/
rm ./kafka_2.12-2.8.0.tgz

# git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
mkdir -p ~/git

# set git name/email
myname="Trevor Gudmundsen"
myemail="trevor@ennetix.com"
git config --global user.name $myname
git config --global user.email $myemail

# common settings and env variable loading on login
echo 'setxkbmap -option caps:escape' >> ~/.profile
echo 'NODE_OPTIONS=--max_old_space_size=4096' >> ~/.pam_environment
echo 'SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=4G -Xms4G -Xmx4G -XX:MaxMetaspaceSize=4G"' >> ~/.pam_environment

# import sublime-text settings
git clone https://github.com/vuejs/vue-syntax-highlight.git ~/.config/sublime-text-3/Packages/
wget -P ~/.config/sublime-text-3/Packages/User/ https://raw.githubusercontent.com/trevorgud/ubuntu-quickstart/main/sublime-text/vue.sublime-settings
wget -P ~/.config/sublime-text-3/Packages/User/ https://raw.githubusercontent.com/trevorgud/ubuntu-quickstart/main/sublime-text/Preferences.sublime-settings

# vim settings/plugin installation
mkdir -p ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget -P ~/ https://raw.githubusercontent.com/trevorgud/ubuntu-quickstart/main/vim/.vimrc
vim +PlugInstall +qall
vim +PluginInstall +qall
wget ~/.vim/colors/ https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim

# import tmux settings
mkdir -p ~/.tmux
wget -P ~/.tmux/ https://raw.githubusercontent.com/trevorgud/ubuntu-quickstart/main/tmux/session1

#import docker settings
mkdir -p ~/.docker
wget -P ~/.docker/ https://raw.githubusercontent.com/trevorgud/ubuntu-quickstart/main/docker/config.json
