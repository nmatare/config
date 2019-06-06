#!/bin/bash
# Short Description: standard tmux/vim setup for existing project
project(){
  if [[ -z "$1" ]]; then
    echo "You must a valid project name as the first argument"
    return
  fi
 
  if [[ ! -d ~/projects/"$1" ]]; then
    echo "Could not find the ~/projects/$1 directory"
    return
  fi
  
  cd ~/projects/"$1"
  tmux start-server
  tmux new-session -d -s "$1" -n vim
  tmux selectp -t 0
  tmux send-keys "vim" C-m

  tmux split -v -p 0
  tmux select-window -t "$1"
  tmux attach-session -t "$1"
}

_install_packages(){
  cd $HOME
  git clone https://github.com/nmatare/config.git
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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
