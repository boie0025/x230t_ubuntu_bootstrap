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

directory "/home/#{username}/.irssi" do
  action :create
end

cookbook_file "irssi.config" do
  path "/home/#{username}/.irssi/config"
  action :create
end
