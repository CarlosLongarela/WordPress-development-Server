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

apt update
apt install php-cli unzip

cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

export PATH="$PATH:$HOME/.config/composer/vendor/bin"

source ~/.bashrc
source ~/.zshrc