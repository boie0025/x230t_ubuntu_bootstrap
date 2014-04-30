#!/bin/bash

# configure base ubuntu vm for virtualbox

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoclean -y
sudo apt-get autoremove -y
sudo /opt/VBoxGuestAdditions-4.3.6/uninstall.sh
sudo apt-get install virtualbox-guest-additions-iso
software-properties-gtk --open-tab=4
