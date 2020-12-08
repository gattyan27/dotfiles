#!/bin/sh

# dockerインストール
sudo amazon-linux-extras install -y docker
sudo systemctl enable docker
sudo systemctl start  docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo gpasswd -a $USER docker

# tmuxインストール
sudo yum install -y tmux

# nodeインストール
curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
sudo yum install -y --enablerepo=nodesource nodejs

