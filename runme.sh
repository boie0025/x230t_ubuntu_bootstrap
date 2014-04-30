!/bin/bash

sudo apt-get update && apt-get upgrade -y

sudo mkdir -p /var/chef/cookbooks

sudo cp -r x230t /var/chef/cookbooks

sudo apt-get install curl

sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash

sudo chef-solo --override-runlist 'recipe[x230t]'
