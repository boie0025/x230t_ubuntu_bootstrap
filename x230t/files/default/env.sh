#!/bin/bash

# Setup the dictionary function to automatically 
# |less and accept multiple args
function ssdcv(){
    local lookup_word=$@
    sdcv $lookup_word |less
}

# Create multiple tmux windows
function ttmux(){
    tmux new-session -d -s 0
    tmux new-window -t 0:1 -n 'one'
    tmux new-window -t 0:2 -n 'two'
    tmux new-window -t 0:3 -n 'three'
    tmux new-window -t 0:4 -n 'four'
    tmux new-window -t 0:5 -n 'five'
    tmux new-window -t 0:6 -n 'six'
    tmux new-window -t 0:7 -n 'seven'
    tmux select-window -t 0:1 
    tmux -2 attach-session -t 0
}

# Modify the cli to open images from the
# terminal using Ubuntu's Image Viewer
# and alias the command to something more
# reasonable...
function iviewer(){
    image_file=$@
    eog $image_file
}
