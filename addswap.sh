#!/bin/bash

sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo sysctl vm.swappiness=10
sudo sysctl vm.vfs_cache_pressure=50
sudo echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
sudo echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.conf
