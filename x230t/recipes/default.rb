#
# Cookbook Name:: x230t
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

audio = %w{audacity clementine}
databases = %w{mysql-workbench}
entertainment = %w{fceu mplayer}
graphics = %w{blender gimp imagemagick inkscape pdftk scribus sng ufraw}
libraries = %w{libglib2.0-dev libapparmor1 libjpeg62}
mail = %w{fetchmail mutt}
networking = %w{gns3 mtr nmap wireshark}
office = %w{gnucash keepassx sdcv xournal}
programming = %w{arduino git qt5-default qttools5-dev-tools r-base smartgit tmux vim virtualbox}
security = %w{scrub shred}
system = %w{build-essential ctags curl dkms cellwriter compizconfig-settings-manager indicator-multiload testdisk ufsutils xinetd}
web = %w{lynx node}

packages = [ audio, databases, entertainment, graphics, mail, networking, office, programming, security, system, web ]


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
  apt-get-upgrade
  apt-get autoclean
  apt-get autoremove
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
