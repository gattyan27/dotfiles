#!/bin/sh
sudo yum install -y zsh
sudo yum install -y util-linux-user

# sudo chsh user /bin/zsh

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.zshrc ~/.zshrc

ln -sf ~/dotfiles/.zprezto/runcoms/zlogin ~/.zlogin
ln -sf ~/dotfiles/.zprezto/runcoms/zlogout ~/.zlogout
ln -sf ~/dotfiles/.zprezto/runcoms/zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/.zprezto/runcoms/zprofile ~/.zprofile
ln -sf ~/dotfiles/.zprezto/runcoms/zshenv ~/.zshenv


