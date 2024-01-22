#!/bin/bash

# any future command that fails will exit the script
set -e

################## Backend update ###############################
# Change directory to where the project is stored
cd /var/www/html/[your project repository]/

sudo git stash

sudo git pull origin main
# Install packages
sudo docker system prune -f

# Build the application
sudo docker-compose up -d --build

# restart server
sudo systemctl restart nginx

echo "****************************************************************"
echo "--- Backend update complete"
echo "****************************************************************"
