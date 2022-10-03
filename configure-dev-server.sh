#!/bin/bash

# Install the basics... Stage 1 (Directly Provisioned from IaaS Provider)

# Copyright 2022 - Carlos Longarela https://tabernawp.com/

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo " "
apt update

echo " "
echo "******************************************************************************"
echo "****************************** INSTALLING MC *********************************"
echo "******************************************************************************"
echo " "
if command -v mc >/dev/null; then
  echo -e "${GREEN}MC previously installed${ENDCOLOR}"
else
  apt install mc
fi

echo " "
echo "*******************************************************************************************"
echo "****************************** INSTALLING Fonts-Powerline *********************************"
echo "*******************************************************************************************"
echo " "
## command do not return path on installed, no problem, if installed, will tell us :)
apt install fonts-powerline

echo " "
echo "************************************************************************************"
echo "****************************** INSTALLING Composer *********************************"
echo "************************************************************************************"
echo " "
if command -v composer >/dev/null; then
  echo -e "${GREEN}MC previously installed${ENDCOLOR}"
else
  apt install composer
fi

#apt install zsh

#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change theme to agnoster editing /root/.zshrc and changing ZSH_THEME=robbyrussellto ZSH_THEME=agnoster

#git config --global user.name "Carlos Longarela Dev Machine 1"
#git config --global user.email "carlos+devm1@longarela.eu"

#npm install -g n

#n lts
#n latest
#n prune

#cd ~
#curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
#HASH=`curl -sS https://composer.github.io/installer.sig`
#echo $HASH
#php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
#sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

#export PATH="$PATH:$HOME/.config/composer/vendor/bin"

#source ~/.bashrc
#source ~/.zshrc

echo " "
apt autoremove
