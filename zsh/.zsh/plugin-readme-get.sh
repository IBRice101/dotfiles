#!/bin/bash

# plugin array
declare -a arr=("archlinux" "battery" "git" "golang" "man" "nmap" "pep8" "python" "rsync" "sudo" "tmux" "z" "zsh-autosuggestions" "zsh-syntax-highlighting")

# loop through array
for i in "${arr[@]}"
  do
	# get readme for each plugin I have installed
	wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/$i/README.md -O $i.md
done
