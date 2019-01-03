#!/bin/bash

cd /etc/apt
mv sources.list sources.list.bak
cat > sources.list <<- "EOF"
deb http://ftp.sg.debian.org/debian/ stretch main
deb http://ftp.sg.debian.org/debian/ stretch-updates main
deb http://ftp.sg.debian.org/debian stretch contrib non-free
deb-src http://ftp.sg.debian.org/debian/ stretch main
deb-src http://ftp.sg.debian.org/debian/ stretch-updates main
deb-src http://security.debian.org/debian-security stretch/updates main
deb http://security.debian.org/debian-security stretch/updates main
deb http://security.debian.org/ stretch/updates main contrib non-free
# deb http://ftp.sg.debian.org/debian testing main contrib non-free
EOF
cd /
apt update && apt install -y sudo
sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt install -y git mc vim-nox
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo sysctl vm.swappiness=10
sudo sysctl vm.vfs_cache_pressure=50
sudo echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
sudo echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.conf
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install -y docker-ce
sudo apt update && apt install -y nano debconf-utils mysql-client libmysqlclient-dev gnupg wget git gcc g++ fpc make python-dev libxml2-dev libxslt1-dev zlib1g-dev gettext curl wget openssl ruby ruby-full ruby-dev gem
wget -q --no-check-certificate -O- https://bootstrap.pypa.io/get-pip.py | sudo python
reboot
