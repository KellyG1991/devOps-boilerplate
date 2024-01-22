# DevOps Boilerplate for AWS

This guide provides a step-by-step process for deploying a server and setting up a CI/CD pipeline.

## New Server Setup

1. Log in to your AWS IAM User.
2. Navigate to EC2 Instances.
3. Create an instance with the appropriate specifications for your server.
4. Save the SSH private key (automatically generated during EC2 instance creation) and the server's public IP for future use in CI/CD pipelines.

## NGINX Setup

1. SSH into the server.
2. Update the server and install necessary libraries using `server_update.sh`. Make the script executable: `chmod +x server_update.sh`.
3. Navigate to `/var/www/html`.
4. Clone your project using Git:
   - Configure Git credentials: `git config --global credential.helper 'store'`.
   - Clone your repository: `git clone "your repository link"`.
5. Create a `.env` file with project secrets: `sudo nano .env`.
6. Run `nginx_setup.sh` to initialize your project. Make the script executable: `chmod +x nginx_setup.sh`.

## Create Hosted Zone

1. In the AWS Dashboard, search for Hosted Zones.
2. Create a new hosted zone for the project domain (e.g., example.com).
3. Use the provided name servers to update the domain settings where it was purchased.
4. Create an A record, adding the IP address (SERVER_IP) of the AWS instance.

## Secure the Instance

1. Navigate to the EC2 instance and SSH into it.
2. Run `secure_server.sh`. Make the script executable: `chmod +x secure_server.sh`.

### CI/CD Pipeline

#### GitLab

1. Navigate to the GitLab repository.
2. In the left panel, select `Settings > CI/CD`.
3. Expand `Variables` and create variables like SERVER_IP and SSH_PRIVATE_KEY.
4. Create a `.gitlab-ci.yml` file at the project root for the CI/CD pipeline.

#### GitHub

1. Navigate to the GitHub repository.
2. Go to `Settings > Security > Secrets and Variables > Actions`.
3. Add new repository secrets for SERVER_IP and SSH_PRIVATE_KEY.
4. Create a `.github/workflows` folder at the project root and configure YAML files for the CI/CD pipeline.

Feel free to customize the pipeline configurations based on your project's needs.
