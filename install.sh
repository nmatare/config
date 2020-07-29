#!/bin/bash
# Short Description: standard tmux/vim setup for existing project
project(){
  if [[ -z "$1" ]]; then
    echo "You must a valid project name as the first argument"
    return
  fi
 
  if [[ ! -d "~/projects/$1" ]]; then
    echo "Could not find the ~/projects/$1 directory"
    return
  fi
  
  cd "~/projects/$1"

  tmux kill-server > /dev/null 2>&1

  # Dual monitor setup
  # Press ctrl-B then n to switch between main and sidecar

  # First terminal create server and run in the anticpated main
  gnome-terminal --hide-menubar -- bash -c """ \
    tmux start-server \
    && tmux new-session -s main -d \
    && tmux selectp -t main \
    && tmux send-keys vim C-m \
    && tmux select-window -t main \
    && tmux attach-session -t main
  """ &

  # Smaller monitor create a new window
  gnome-terminal --hide-menubar -- bash -c """ \
    tmux new-session -t main -s sidecar -d \
    && tmux new-window \
    && tmux select-window -t sidecar \
    && tmux attach-session -t sidecar
  """
}

_install_packages(){
  cd "${HOME}"
  git clone https://github.com/nmatare/config.git
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  pip install notedown
}

_install_config_files(){
  cp ~/config/.tmux.conf ~/.tmux.conf 
  cp ~/config/.vimrc ~/.vimrc
  declare -f project >> ~/.bashrc
  echo "set -o vi" >> ~/.bashrc
}

_clean_up_install(){
  rm -rf config/
}

_install_packages
_install_config_files 
_clean_up_install

"$@"
rm -- "$0"

# EOF
