#!/bin/bash

sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo apt-get update -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository universe
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update -y
sudo apt-get install certbot python3-certbot-nginx -y

