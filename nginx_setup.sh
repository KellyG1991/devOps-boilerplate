#!/bin/bash

# any future command that fails will exit the script
set -e

# Containerize your project
cd ~/var/www/html/[PROJECT NAME]
sudo docker-compose up -d --build

# Stop nginx and Delete the nginx default file
sudo systemctl stop nginx
sudo rm -f /etc/nginx/sites-enabled/default

# Write initial servers for nginx
# Define the path for the Nginx configuration file
nginx_conf="/etc/nginx/sites-enabled/default"

# Create the Nginx configuration file
cat <<EOL > $nginx_conf
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name _;

    client_max_body_size 100m;
    root /var/www/html;
    index index.html;

    location / {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;

        #THIS IS THE DEFAULT PORT, MAKE SURE TO CHANGE TO THE CORRECT PORT
        proxy_pass http://127.0.0.1:3000; 
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
EOL

# Restart Nginx to apply changes
sudo service nginx restart

echo "Nginx configuration has been updated."
