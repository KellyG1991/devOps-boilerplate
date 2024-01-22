#!/bin/bash

# any future command that fails will exit the script
set -e
# Lets write the public key of our aws instance
eval $(ssh-agent -s)
echo "$STAGE_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null

# we have already setup the DEPLOYER_SERVER in our gitlab settings which is a
# comma seperated values of ip addresses.
STAGE_SERVER=$STAGE_SERVER

# lets split this string and convert this into array
# In UNIX, we can use this commond to do this
# ${string//substring/replacement}
# our substring is "," and we replace it with nothing.
ALL_SERVERS=(${STAGE_SERVER//,/ })
echo "ALL_SERVERS ${ALL_SERVERS}"

# Lets iterate over this array and ssh into each EC2 instance
# Once inside.
# 1. Change directory to where the project is stored
# 2. Take a pull
# 3. Reload the server
for server in "${ALL_SERVERS[@]}"
do
  echo "deploying to ${server}"
  ssh -o StrictHostKeyChecking=no ubuntu@${server} 'bash -s' < ./deploy/stage_update.sh
done
