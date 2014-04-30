git pull

sudo cp -r x230t /var/chef/cookbooks

sudo chef-solo --override-runlist 'recipe[x230t]'
