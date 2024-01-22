#!/bin/bash

# any future command that fails will exit the script
set -e
################## Backend update ###############################
# Change directory to where the project is stored
cd /var/www/html/[your project name]/

sudo docker system prune -f 

sudo git stash

sudo git fetch

sudo git checkout dev

# pull the changes
sudo git pull origin dev

sudo docker-compose down

# Build the application
sudo docker-compose up -d --build

echo "****************************************************************"
echo "--- Backend update complete"
echo "****************************************************************"