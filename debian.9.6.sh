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
sudo apt update && apt install -y nano debconf-utils mysql-client libglpk40 libcrypt-mysql-perl libmariadbclient-dev-compat default-libmysqlclient-dev gnupg wget git gcc g++ fpc make python-dev libxml2-dev libxslt1-dev zlib1g-dev gettext curl wget openssl ruby ruby-full ruby-dev gem
wget -q --no-check-certificate -O- https://bootstrap.pypa.io/get-pip.py | sudo python
pip install virtualenv
curl -sL https://deb.nodesource.com/setup_11.x | bash -
sudo apt-get install gcc g++ make
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn
sudo apt-get install -y build-essential nodejs
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh -o install_nvm.sh
bash install_nvm.sh
source ~/.profile
nvm install 11.6.0
nvm use 11.6.0
nvm alias default 11.6.0
nvm use default
npm install node-sass
npm install minimatch
npm install browserslist
npm install boom
npm install hoek
npm install cryptiles
sudo apt install -y synaptic apt-xapian-index gdebi gksu
sudo apt install -y ttf-freefont ttf-mscorefonts-installer
sudo apt install -y fonts-noto
sudo apt install -y qt4-qtconfig
sudo apt install -y ssh net-tools byobu sysstat ncdu htop nload pydf iotop
echo 'export PATH="$PATH:/sbin"' >> $HOME/.bashrc
sudo apt install -y ruby-full
git clone https://github.com/sass/sass.git
cd sass
gem build sass.gemspec
gem install sass-*.gem
