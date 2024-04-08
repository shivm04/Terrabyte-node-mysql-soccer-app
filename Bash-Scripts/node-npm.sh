#!/bin/bash

# Update package index
sudo apt update -y
curl -sL https://deb.nodesource.com/setup_18.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh

# Install Node.js and npm
sudo apt install nodejs -y
npm install express express-fileupload body-parser mysql ejs req-flash --save
npm install nodemon -g

# Print Node.js and npm versions
node -v
npm -v
