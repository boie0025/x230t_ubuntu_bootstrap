#!/bin/bash

# Manual Congirations to make
# Set terminal default size to 151 columns and 18 rows
# Check run command as a login shell
# Change to built-in scheme of Green on Black
# Slide the transparent bar approximately 80% to the right

# Firefox should have the extensions 'Tamper Data 11.0.1' 'Web Developer 1.2.5' installed

# Get the basic packages up and running

sudo apt-get update && sudo apt-get upgrade -y

for i in wireshark keepassx virtualbox arduino fceu blender inkscape gimp scribus ufraw dropbox mysql-workbench qtcreator smartgit audacity clementine vim gnucash git nmap gnome-session-fallback mysql-server tomcat7 apache2 xournal curl imagemagick tmux dkms python2.7 cellwriter; do
    sudo apt-get -y install $i
done

sudo apt-get -y install build-essential make libglib2.0-dev

# Get Chrome Running

cd /tmp

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb

cd

# Get Magick Rotation Working

cd /opt

sudo wget https://launchpad.net/magick-rotation/trunk/1.6/+download/magick-rotation-1.6.2.tar.bz2

sudo bunzip2 magick-rotation-1.6.2.tar.bz2

sudo tar -xf magick-rotation-1.6.2.tar

sudo rm magick-rotation-1.6.2.tar

sudo ./MAGICK-INSTALL

cd

# Get Rails running

\curl -L https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm

sudo rvm requirements

rvm install ruby

rvm use ruby --default

rvm rubygems current

gem install sqlite3

gem install rails

# Get Java 7 running

sudo add-apt-repository ppa:webupd8team/java -y

sudo apt-get update

sudo apt-get install oracle-java7-installer

# Get STS-Spring Running

cd /opt

sudo wget http://download.springsource.com/release/STS/3.4.0/dist/e4.3/spring-tool-suite-3.4.0.RELEASE-e4.3.1-linux-gtk-x86_64.tar.gz

sudo tar -xvzf spring-tool-suite-3.4.0.RELEASE-e4.3.1-linux-gtk-x86_64.tar.gz

sudo rm *.gz

cd /usr/share/applications

echo '[Desktop Entry]
Name=SpringSource Tool Suite
Comment=SpringSource Tool Suite
Exec=/opt/springsource/sts-3.4.0.RELEASE/STS
Icon=/opt/springsource/sts-3.4.0.RELEASE/icon.xpm
StartupNotify=true
Terminal=false
Type=Application
Categories=Development;IDE;Java;' > STS.desktop

cd

# Setup Configurations

# Vim configuration

echo 'colorscheme delek
set nu
set encoding=utf-8

" Use incremental searching
set incsearch

" Highlight all search results
set hlsearch

" Highlight matching brace
set showmatch

" Set standard setting for PEAR coding standards
set tabstop=4
set shiftwidth=4

" Autoexpand tabs to spaces
set expandtab

" Auto indent after a {
set autoindent
set smartindent

" Show auto complete menus
set wildmenu

" Make wildmenu behave like bash completion
set wildmode=list:longest

" Set undo levels
set undolevels=1000' > .vimrc

# Setup tmux

mkdir ~/bin

cd ~/bin

echo '#!/bin/sh
tmux new-session -d -s 0
tmux new-window -t 0:1 -n 'one'
tmux new-window -t 0:2 -n 'two'
tmux new-window -t 0:3 -n 'three'
tmux new-window -t 0:4 -n 'four'
tmux new-window -t 0:5 -n 'five'
tmux new-window -t 0:6 -n 'six'
tmux new-window -t 0:7 -n 'seven'
tmux select-window -t 0:1
tmux -2 attach-session -t 0' > tmux.sh

chmod 0755 tmux.sh

cd

echo '# Basic functionality

unbind C-b 
set -g prefix C-a 
set-window-option -g utf8 on

######COLOUR (Solarized 256)

# default statusbar colors

set-option -g status-bg colour235 #base02
set-option -g status-fg colour136 #yellow
set-option -g status-attr default

# default window title colors

set-window-option -g window-status-fg colour244 #base0
set-window-option -g window-status-bg default

#set-window-option -g window-status-attr dim

# active window title colors

set-window-option -g window-status-current-fg colour166 #orange
set-window-option -g window-status-current-bg default

#set-window-option -g window-status-current-attr bright

# pane border

set-option -g pane-border-fg colour235 #base02
set-option -g pane-active-border-fg colour240 #base01

# message text

set-option -g message-bg colour235 #base02
set-option -g message-fg colour166 #orange

# pane number display

set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock

set-window-option -g clock-mode-colour colour64 #green' > .tmux.conf

# Config bash

echo 'alias ls="ls --color"
alias vi="vim"' >> .bashrc

# Make sure we grabbed everything

sudo apt-get -fy install
sudo apt-get update && sudo apt-get upgrade -y

# Finish
echo "All done here!"
