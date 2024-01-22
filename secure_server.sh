#!/bin/bash

# For this, we are assuming the domain or hosted zone is example.com
# This command will also automatically update /etc/nginx/sites-enabled/default file with the new ssl certificates
sudo certbot certonly --nginx -d example.com

# incase there is a subdomain for the hosted zone, run the following
sudo certbot certonly --nginx -d subdomain.example.com

# restart nginx
sudo systemctl restart nginx