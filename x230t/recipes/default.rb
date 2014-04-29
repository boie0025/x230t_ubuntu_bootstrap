#
# Cookbook Name:: x230t
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "configure_firewall" do
  user "root"
  ufw default deny
  ufw enable
end

bash "disable_the_guest_account" do
  user "root"
  echo 'allow-guest=false' >> /etc/lightdm/lightdm.conf
end

bash "update_the_system" do
  user "root"
  code <<-EOH
  apt-get update
  apt-get upgrade
  apt-get autoclean
  apt-get autoremove
  EOH
end

bash "install_base_libraries" do
  user "root"
  code <<-EOH
  apt-get install libglib2.0-dev -y
  apt-get install libapparmor -y
  apt-get install libjpeg62 -y
  EOH
end

File.open("/var/chef/cookbooks/x230t/files/default/programs").each do |pkg|
  package "#{pkg}" do
    action :install
  end
end
