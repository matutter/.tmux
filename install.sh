#!/bin/bash

uuid="f295287e-8869-11e7-816a-7f090bc0c562"
this_dir=$(dirname $(readlink -f $BASH_SOURCE))
bin_dir="$HOME/.bin"
rc_file="$HOME/.bashrc"

function install_file {
  src=$1
  dst=$2

  if cmp --silent $src $dst; then
    echo "[ ] $dst (no change)"
  else
    cp $src $dst
    echo "[+] installed $dst"
  fi
}


if grep -q "$uuid" "$rc_file"; then
  echo "[ ] uuid watermark $uuid (no change)"
else
  printf "\n##\n#${uuid}\nsource $bin_dir/$uuid.sh\n\n" >> $rc_file
  echo "[+] added uuid watermark $uuid"
fi

mkdir -p $bin_dir

install_file "$this_dir/source-me.sh" "$bin_dir/$uuid.sh"
install_file "$this_dir/multitail.conf" "$HOME/.multitail.conf"
install_file "$this_dir/tmux.conf" "$HOME/.tmux.conf"
install_file "$this_dir/tmux.conf.local" "$HOME/.tmux.conf.local"

source $rc_file
