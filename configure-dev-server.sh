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

####################################################################################################
####################################################################################################
####################################################################################################
gituser="Carlos Longarela Dev Machine 1"
gitmail="carlos+devm1@longarela.eu"

bashprofile="/root/.bashrc"
zshprofile="/root/.zshrc"

oh_my_prev_theme='ZSH_THEME="robbyrussell"'
oh_my_curr_theme='ZSH_THEME="agnoster"'

function composer_add_path() {
    local profile=$1
    if [ grep -Fxq "/.config/composer/vendor/bin" "$profile" ]
    then
        echo -e "${txtgrn}Composer PATH previously added to $profile${txtwht}";
    else
        echo '
# Composer path.
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
' >> $profile;
        echo -e "${txtgrn}Composer PATH added to $profile${txtwht}";
        # source /root/.bashrc or source /root/.zshrc
        source $profile;
    fi
}

####################################################################################################
####################################################################################################
####################################################################################################
echo -e "${txtpur} "
apt update
echo -e "${txtwht} "

####################################################################################################
####################################################################################################
####################################################################################################
echo -e "${txtylw} "
echo "******************************************************************************"
echo "****************************** INSTALLING MC *********************************"
echo "******************************************************************************"
echo -e "${txtwht} "

if command -v mc >/dev/null;
then
  echo -e "${txtgrn}MC previously installed${txtwht}"
else
  apt install mc
fi

####################################################################################################
####################################################################################################
####################################################################################################
echo -e "${txtylw} "
echo "*********************************************************************************************"
echo "****************************** Configure Git user and email *********************************"
echo "*********************************************************************************************"
echo -e "${txtwht} "

apt install git-flow
git config --global user.name "${gituser}"
git config --global user.email "${gitmail}"

echo -e "${txtgrn}Installed Git-flow${txtwht}";
echo -e "${txtgrn}Configured Git as user.name ${gituser}${txtwht}";
echo -e "${txtgrn}Configured Git as user.email ${gitmail}${txtwht}";

####################################################################################################
####################################################################################################
####################################################################################################
echo -e "${txtylw} "
echo "*******************************************************************************************"
echo "****************************** INSTALLING Fonts-Powerline *********************************"
echo "*******************************************************************************************"
echo -e "${txtwht} "

## Here, command do not return path on installed, no problem, if installed, will tell us :)
apt install fonts-powerline

####################################################################################################
####################################################################################################
####################################################################################################
echo -e "${txtylw} "
echo "************************************************************************************"
echo "****************************** INSTALLING Composer *********************************"
echo "************************************************************************************"
echo -e "${txtwht} "

if command -v composer >/dev/null;
then
  echo -e "${txtgrn}Composer previously installed${txtwht}";
else
  apt install composer;
  composer_add_path $bashprofile;
fi


####################################################################################################
####################################################################################################
####################################################################################################
echo -e "${txtylw} "
echo "*************************************************************************************"
echo "****************************** INSTALLING NPM Utils *********************************"
echo "*************************************************************************************"
echo -e "${txtwht} "

npm install -g n
n lts
n latest
n prune

####################################################################################################
####################################################################################################
####################################################################################################
echo -e "${txtylw} "
echo "*********************************************************************************"
echo "****************************** INSTALLING PHPCS *********************************"
echo "*********************************************************************************"
echo -e "${txtwht} "

composer global require squizlabs/php_codesniffer

####################################################################################################
####################################################################################################
####################################################################################################
echo -e "${txtylw} "
echo "********************************************************************************************"
echo "****************************** INSTALLING Coding Standards *********************************"
echo "********************************************************************************************"
echo -e "${txtwht} "

cd /root
mkir standards
echo -e "${txtgrn}/root/standards dir created${txtwht}";

cd /root/standards
git clone https://github.com/WordPress/WordPress-Coding-Standards wpcs
phpcs --config-set installed_paths /root/standards/wpcs
echo -e "${txtgrn}Installed WordPress Coding Standards${txtwht}";

cd /root/standards
git clone https://github.com/PHPCompatibility/PHPCompatibility phpc
phpcs --config-set installed_paths /root/standards/wpcs,/root/standards/phpc
echo -e "${txtgrn}Installed PHP Compatibility Coding Standard${txtwht}";

cd /root/standards
git clone https://github.com/PHPCompatibility/PHPCompatibilityWP phpcwp
phpcs --config-set installed_paths /root/standards/wpcs,/root/standards/phpc,/root/standards/phpcwp
git checkout master
echo -e "${txtgrn}Installed PHPCompatibilityWP${txtwht}";

cd /root/standards
git clone https://github.com/PHPCompatibility/PHPCompatibilityParagonie phpcp
phpcs --config-set installed_paths /root/standards/wpcs,/root/standards/phpc,/root/standards/phpcwp,/root/standards/phpcp
echo -e "${txtgrn}Installed PHPCompatibilityParagonie${txtwht}";

cd /root/standards
git clone https://github.com/phpcsstandards/phpcsutils/ phpcsu
phpcs --config-set installed_paths /root/standards/wpcs,/root/standards/phpc,/root/standards/phpcwp,/root/standards/phpcp,/root/standards/phpcsu
echo -e "${txtgrn}Installed PHPCSUtils${txtwht}";

####################################################################################################
####################################################################################################
####################################################################################################
echo -e "${txtcyn}"
while true; do
    read -p "Do you wish to install ZSH and Oh My Zsh? [YN]" yn
    case $yn in
        [Yy]* )
            echo -e "${txtred}IMPORTANT:${txtgrn} Dot not change to ZSH by default in the installation or this script will stop to execute${txtwht}";
            apt install zsh;
            sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
            # Change theme to agnoster editing /root/.zshrc and changing ZSH_THEME=robbyrussell to ZSH_THEME=agnoster
            sed -i "s:${oh_my_prev_theme}:${oh_my_curr_theme}:g" "$zshprofile"
            composer_add_path $zshprofile
            echo -e "${txtwht}";
            break
            ;;
        [Nn]* )
            echo -e "${txtwht}";
            break
            ;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo -e "${txtwht}"


####################################################################################################
####################################################################################################
####################################################################################################
echo -e "${txtcyn}"
while true; do
    read -p "Do you wish to autoremove not used packages? [YN]" yn
    case $yn in
        [Yy]* ) apt autoremove; echo -e "${txtwht}"; break;;
        [Nn]* ) echo -e "${txtwht}"; break;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo -e "${txtwht}"

echo -e "${txtcyn}"
echo "___________       ___.                                        __      __ __________  "
echo "\__    ___/_____  \_ |__    ____ _______   ____  _____       /  \    /  \\______   \ "
echo "  |    |   \__  \  | __ \ _/ __ \\_  __ \ /    \ \__  \      \   \/\/   / |     ___/ "
echo "  |    |    / __ \_| \_\ \\  ___/ |  | \/|   |  \ / __ \_     \        /  |    |     "
echo "  |____|   (____  /|___  / \___  >|__|   |___|  /(____  /      \__/\  /   |____|     "
echo "                \/     \/      \/             \/      \/            \/               "
echo " "
echo " "
echo " "
echo -e "${txtgrn}"
echo "Script finisihed, please, check that all is correct and check docs."
echo "By the way, reload profile 'source /root/.bashrc' or 'source /root/.zshrc'"
echo "You can change to zsh with 'zsh'"
echo " "
echo "Thanks, Good WordPress Coding!!!"
echo -e "${txtwht}"
