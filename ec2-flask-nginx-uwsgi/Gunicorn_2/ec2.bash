#!/usr/bin/env bash

apt update
apt install python3-venv 

# // Create directory
mkdir helloworld
cd helloworld

# // Create the virtual environment
python3 -m venv venv

# // Activate the virtual environment
source venv/bin/activate

# // Install Flask
pip install Flask


pip install gunicorn
systemctl daemon-reload
systemctl start helloworld
systemctl enable helloworld

apt-get nginx
systemctl start nginx
systemctl enable nginx

systemctl restart nginx