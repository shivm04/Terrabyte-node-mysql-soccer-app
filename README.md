## https://dev.to/achowba/build-a-simple-app-using-node-js-and-mysql-19me
## Project Repo Link :- https://github.com/shivm04/Terrabyte-node-mysql-soccer-app.git

## Node JS , NPM and mysql installation on ubutnu 22 
```
curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
mkdir soccer-app
cd soccer-app
npm init
npm install express express-fileupload body-parser mysql ejs req-flash --save
npm install nodemon -g
sudo apt update
sudo apt install mysql-server
sudo systemctl start mysql.service
sudo mysql_secure_installation
```
## Login to the Mysql and set the root passwd & create required database
```
mysql -u root -p
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'shivam@123';
FLUSH PRIVILEGES;

CREATE DATABASE socka;
USE socka;
CREATE TABLE IF NOT EXISTS `players` (
    `id` int(5) NOT NULL AUTO_INCREMENT,
    `first_name` varchar(255) NOT NULL,
    `last_name` varchar(255) NOT NULL,
    `position` varchar(255) NOT NULL,
    `number` int(11) NOT NULL,
    `image` varchar(255) NOT NULL,
    `user_name` varchar(20) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
```

## Change the username & password in the app.js file and then run the Project by using the below command 
nodemon app.js

## Then make the Node ja service permanentlly running 

sudo vi /etc/systemd/system/soccer-app.service
```
[Unit]
Description=My Node.js Application
After=network.target

[Service]
Type=simple
WorkingDirectory=/root/soccer-app
ExecStart=/usr/bin/nodemon /root/soccer-app/app.js
Restart=always
User=root
Group=root
Environment=NODE_ENV=production

[Install]
WantedBy=multi-user.target
```
```
sudo systemctl daemon-reload
sudo systemctl start soccer-app
sudo systemctl enable soccer-app
```

## Nginx Configuration for this
```
server {
    listen 80;
    server_name soccer.shivm07.shop;

    access_log /var/log/nginx/soccer.shivm07.shop_access.log;
    error_log /var/log/nginx/soccer.shivm07.shop_error.log;

    location / {
        proxy_pass http://localhost:2000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```
```
sudo ln -s /etc/nginx/sites-available/soccer.shivm07.shop /etc/nginx/sites-enabled/
nginx -t
systemctl restart nginx
```
### Map your ec2 instance ip with domain name 

### install certbot on ubuntu 
```
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository universe
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot python3-certbot-nginx
certbot
```
## go to your browser and check the SSL is sucessfully enabled or not 




