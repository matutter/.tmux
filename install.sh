#!/bin/bash

m_script_dir=$(dirname $(readlink -f $BASH_SOURCE))


cp "${m_script_dir}/tmux.conf" ~/.tmux.conf
cp "${m_script_dir}/tmux.conf.local" ~/.tmux.conf.local

