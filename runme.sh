!/bin/bash

sudo apt-get update && apt-get upgrade -y

sudo mkdir -p /var/chef/cookbooks

sudo cp x230t.tar /var/chef/cookbooks

sudo tar -xvf /var/chef/cookbooks/x230t.tar

sudo rm /var/chef/cookbooks/x230t.tar

sudo apt-get install curl

sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash

sudo chef-solo --override-runlist 'recipe[x230t]'
