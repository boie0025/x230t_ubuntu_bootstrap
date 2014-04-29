#
# Cookbook Name:: x230t
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "configure_firwall" do
  user "root"
  ufw default deny
  ufw enable
done

bash "disable_the_guest_account" do
  user "root"
  cwd "/etc/lightdm"
  echo 'allow-guest=false' >> lightdm.conf
done

/var/chef/cookbooks/x230t/files/default/programs.each do |pkg|
  package pkg do
    action :install
  end
end
