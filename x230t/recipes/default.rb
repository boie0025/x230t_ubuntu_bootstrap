#
# Cookbook Name:: x230t
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

audio = %w{audacity clementine}
communication = %w{irssi}
databases = %w{mysql-workbench}
entertainment = %w{fceu mplayer}
graphics = %w{blender gimp imagemagick inkscape pdftk scribus sng ufraw}
libraries = %w{libglib2.0-dev libapparmor1 libjpeg62}
mail = %w{fetchmail mutt}
networking = %w{gns3 mtr nmap wireshark}
office = %w{keepassx sdcv xournal}
programming = %w{git qt5-default qttools5-dev-tools r-base tmux vim virtualbox}
security = %w{scrub secure-delete}
system = %w{build-essential curl dkms cellwriter compizconfig-settings-manager indicator-multiload testdisk xinetd}
web = %w{lynx node}

packages = [ audio, communication, databases, entertainment, graphics, mail, networking, office, programming, security, system, web ]

bin_files = %w{env.sh template.pl}
home_directory_files = %w{.tmux.conf .vimrc}

bash "configure_firewall" do
  user "root"
  code <<-EOH
  ufw default deny
  ufw enable
  EOH
end

bash "disable_the_guest_account" do
  user "root"
  code <<-EOH
  echo 'allow-guest=false' >> /etc/lightdm/lightdm.conf
  EOH
end

bash "update_the_system" do
  user "root"
  code <<-EOH
  apt-get update
  apt-get upgrade -y
  apt-get autoclean -y
  apt-get autoremove -y
  EOH
end

libraries.each do |lib|
  package "#{lib}" do
    action :install
  end
end

packages.flatten.each do |pkg|
  package "#{pkg}" do
    action :install
  end
end

bash "lowercase_all_home_directories" do
  code <<-EOH
  find "/home#{node['current_user'}" -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
  EOH
end

directory "/home/#{node['current_user']}/.irssi" do
  owner "#{node['current_user']}"
  action :create
end

cookbook_file "irssi.config" do
  path "/home/#{node['current_user']}/.irssi/config"
  owner "#{node['current_user']}"
  action :create
end

directory "/home/#{node['current_user']}/bin" do
  owner "#{node['current_user']}"
  mode "0700"
  action :create
end

bin_files.each do |file|
  cookbook_file "#{file}" do
    path "/home/#{node['current_user']}/bin/#{file}"
    owner "#{node['current_user']}"
    mode "0700"
    action :create
  end
end

home_directory_files.each do |file|
  cookbook_file "#{file}" do
    path "/home/#{node['current_user']}/#{file}"
    owner "#{node['current_user']}"
    action :create
  end 
end

cookbook_file "STS.desktop" do
  path "/usr/share/applications/STS.desktop"
  action :create
end
