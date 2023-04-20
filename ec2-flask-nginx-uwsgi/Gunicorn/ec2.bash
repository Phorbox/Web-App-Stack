#!/usr/bin/env bash


# set up nginx
# Step 1 || Update your local package index and then install the packages.
apt update
apt install python3-pip 
pip3 install pipenv

source myprojectenv/bin/activate


# Step 2 || Create Venv
python3 -m venv myprojectenv

# Step 3 || Set Up a Flask Application
pip install gunicorn flask

# # Step 5 || Testing Gunicorn’s Ability to Serve the Project
# cd ~/src
# gunicorn --bind 0.0.0.0:5000 wsgi:app
# cd
 

# Step 6 || Create a systemd Unit File
mv app.service /etc/systemd/system/ -n

systemctl start app
systemctl enable app


