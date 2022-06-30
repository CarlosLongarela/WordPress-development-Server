#!/bin/bash

apt install zsh

apt install fonts-powerline

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change theme to agnoster editing /root/.zshrc and changing ZSH_THEME=robbyrussellto ZSH_THEME=agnoster

git config --global user.name "Carlos Longarela Dev Machine 1"
git config --global user.email "carlos+devm1@longarela.eu"

npm install -g n

n lts
n latest
n prune
