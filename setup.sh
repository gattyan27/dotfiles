#! /bin/sh

# yumの更新
sudo yum install -y gcc
sudo yum update -y
sudo yum install -y yum-cron
sudo amazon-linux-extras install epel

# タイムゾーン設定
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
# sudo vi /etc/sysconfig/clock
# ZONE="Asia/Tokyo"
# UTC=false

# 文字コードを日本語に設定
# sudo vi /etc/sysconfig/i18n
# LANG=ja_JP.UTF-8

# ユーザー追加
sudo useradd gattyan
sudo mkdir /home/gattyan/.ssh
sudo cp -a /home/ec2-user/.ssh/authorized_keys /home/gattyan/.ssh/
sudo chmod 700 /home/gattyan/.ssh
sudo chmod 600 /home/gattyan/.ssh/authorized_keys
sudo chown -R gattyan:gattyan /home/gattyan/.ssh

sudo mv ~/dotfiles /home/gattyan
sudo chown -R gattyan:gattyan /home/gattyan/dotfiles
