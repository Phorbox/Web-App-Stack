#!/usr/bin/env bash


# set up nginx
# Step 1 – Installing Nginx
apt update
apt install nginx

# Step 2 – Adjusting the Firewall
# ufw app list
ufw allow 'Nginx HTTP'
ufw allow 'OpenSSH'

# systemctl start nginx
# ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

# Step 1 — Installing the Components from the Ubuntu Repositories
apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools

# Step 2 — Creating a Python Virtual Environment
apt install python3-venv
cd myproject
python3 -m venv myprojectenv
source myprojectenv/bin/activate

# Step 3 — Setting Up a Flask Application
pip install wheel
pip install uwsgi flask
pip install flask-login
ufw allow 5000

# Step 4 — Configuring uWSGI
# Step 5 — Creating a systemd Unit File
mv myproject.service /etc/systemd/system/ -n
systemctl start myproject
systemctl enable myproject

# Step 6 — Configuring Nginx to Proxy Requests
mv myproject /etc/nginx/sites-available -n
ln -s /etc/nginx/sites-available/myproject /etc/nginx/sites-enabled
systemctl restart nginx
ufw delete allow 5000
ufw allow 'Nginx Full'

# # systemctl status myproject