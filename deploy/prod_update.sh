#!/bin/bash

# any future command that fails will exit the script
set -e
################## Backend update ###############################
# Change directory to where the project is stored
cd /var/www/html/[your project name]/

sudo docker system prune -f 

sudo git stash

sudo git fetch

sudo git checkout main

# pull the changes
sudo git pull origin main

sudo docker-compose down

sudo docker-compose up -d --build

echo "****************************************************************"
echo "--- Backend update complete"
echo "****************************************************************"