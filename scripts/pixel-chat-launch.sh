#!/bin/bash

# This script is used to open a tmux session, with one window for each of the Pixel Chat services.
# The services are: pixel.chat, dashboard, quantum, api, payment, and auth.
# Each of the services can be started with yarn start.
#
# This script should create a session, with one window in each service. Each window should be named after the service.
# Each window will have a pane for neovim, and a pane for yarn start.

# Set the base directory for the Pixel Chat services.
BASE_DIR="~/Code/Pixel\ Chat/"

# Create a new tmux session
tmux new-session -d -s pixel-chat

# Create a function to create a new window, and split it into two panes.
# The first pane will be used for neovim, and the second pane will be used for yarn start.
window=0
function create_window() {
  # if the window is 0, rename it to the service name, otherwise, just create a new window.
  if [ $window -eq 0 ]; then
    tmux rename-window $1
  else
    tmux new-window -n $1
  fi
  # Split the window into two panes horizontally.
  # tmux split-window -v

  # Move to the first pane, and open neovim.
  tmux select-pane -t 0
  tmux send-keys "cd $BASE_DIR$1" C-m
  tmux send-keys "nvim ." C-m

  # Set the first pane to 80% of the window.
  # tmux resize-pane -t 0 -y 90

  # Move to the second pane, and start the service.
  # tmux select-pane -t 1
  # tmux send-keys "cd $BASE_DIR$1 && yarn dev" C-m

  # Increment the window counter.
  window=$((window+1))
}

# Create a window for each of the services.
create_window quantum
create_window auth
create_window api
create_window payment
create_window dashboard
create_window pixel.chat

# Attach to the tmux session.
tmux attach-session -t pixel-chat


