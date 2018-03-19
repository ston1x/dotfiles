#!/bin/bash
tmux new-session -d -n sesh
tmux rename-window zsh
tmux new-window -n rails
tmux selectw -t 2
tmux split-window -h
tmux selectp -t 1
tmux split-window -v
tmux selectp -t 1
tmux send-keys -t 1 C-z 'cd ~/dev/rails; clear' Enter
tmux send-keys -t 2 C-z 'cd ~/dev/rails; clear' Enter
tmux send-keys -t 3 C-z 'cd ~/dev/rails; clear' Enter
tmux -2 attach-session -d
