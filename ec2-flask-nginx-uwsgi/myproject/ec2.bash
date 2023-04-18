#!/bin/bash


# set up nginx
sudo apt update
sudo apt install nginx
sudo ufw app list

sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'OpenSSH'
systemctl status nginx
sudo systemctl start nginx


ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

sudo apt update
sudo apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools
sudo apt install python3-venv
cd ~/myproject
python3 -m venv myprojectenv
source myprojectenv/bin/activate
pip install wheel
pip install uwsgi flask
piup install flask-login

sudo ufw allow 5000

sudo systemctl start myproject
sudo systemctl enable myproject
sudo systemctl status myproject