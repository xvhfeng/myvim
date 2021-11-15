#!/usr/bin/env bash

if [ ! -d "~/.config/nvim/" ];then
	mkdir -p ~/.config/nvim
fi

ln -s `pwd`/neovim-init.vim ~/.config/nvim/init.vim


