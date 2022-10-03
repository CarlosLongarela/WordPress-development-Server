#!/bin/bash

# Install the basics... Stage 1 (Directly Provisioned from IaaS Provider)

# Copyright 2022 - Carlos Longarela https://tabernawp.com/

txtblk='\e[30m' # Black - Regular
txtred='\e[31m' # Red
txtgrn='\e[32m' # Green
txtylw='\e[33m' # Yellow
txtblu='\e[34m' # Blue
txtpur='\e[35m' # Purple
txtcyn='\e[36m' # Cyan
txtwht='\e[0m' # White

gituser="Carlos Longarela Dev Machine 1"
gitmail="carlos+devm1@longarela.eu"

echo -e "${txtpur} "
apt update
echo -e "${txtwht} "

echo -e "${txtylw} "
echo "******************************************************************************"
echo "****************************** INSTALLING MC *********************************"
echo "******************************************************************************"
echo -e "${txtwht} "

if command -v mc >/dev/null; then
  echo -e "${txtgrn}MC previously installed${txtwht}"
else
  apt install mc
fi

echo -e "${txtylw} "
echo "*********************************************************************************************"
echo "****************************** Configure Git user and email *********************************"
echo "*********************************************************************************************"
echo -e "${txtwht} "

git config --global user.name "${gituser}"
git config --global user.email "${gitmail}"


echo -e "${txtylw} "
echo "*******************************************************************************************"
echo "****************************** INSTALLING Fonts-Powerline *********************************"
echo "*******************************************************************************************"
echo -e "${txtwht} "

## Here, command do not return path on installed, no problem, if installed, will tell us :)
apt install fonts-powerline

echo -e "${txtylw} "
echo "************************************************************************************"
echo "****************************** INSTALLING Composer *********************************"
echo "************************************************************************************"
echo -e "${txtwht} "

if command -v composer >/dev/null; then
  echo -e "${txtgrn}Composer previously installed${txtwht}"
else
  apt install composer
fi

echo -e "${txtylw} "
echo "*************************************************************************************"
echo "****************************** INSTALLING NPM Utils *********************************"
echo "*************************************************************************************"
echo -e "${txtwht} "

npm install -g n
n lts
n latest
n prune

#apt install zsh

#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change theme to agnoster editing /root/.zshrc and changing ZSH_THEME=robbyrussellto ZSH_THEME=agnoster

#cd ~
#curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
#HASH=`curl -sS https://composer.github.io/installer.sig`
#echo $HASH
#php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
#sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

#export PATH="$PATH:$HOME/.config/composer/vendor/bin"

#source ~/.bashrc
#source ~/.zshrc

echo -e "${txtcyn}"
while true; do
    read -p "Do you wish to autoremove not used packages?" yn
    case $yn in
        [Yy]* ) apt autoremove; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo -e "${txtwht}"
