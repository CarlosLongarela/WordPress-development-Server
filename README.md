# WordPress development Server

## Install server

* Create the droplet on Vultr, Digital Ocean, etc. with 4GB RAM or more
* Connect to server `# ssh root@11.22.33.44`
* Update server with `# apt update && apt upgrade`

## Configure it with the base system (Gridpane)

* Create server from GridPane.
* Execute the Gridpane commands on machine connected by SSH as root.

## Configure dev tools
* Download `configure-dev-server.sh` from this Github repo and execute it:
```
wget -O cl-dev-server.sh 'https://raw.githubusercontent.com/CarlosLongarela/WordPress-development-Server/main/configure-dev-server.sh'; bash cl-dev-server.sh


```

## Configure base tools
* Install ZSH `# apt install zsh`
* Install Powerline fonts `# apt install fonts-powerline`
* Install Oh My ZSH `# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` 
* Change theme to **agnoster** editing `/root/.zshrc` and changing `ZSH_THEME=robbyrussell`to `ZSH_THEME=agnoster`
* Setting Global Git Username and Email `# git config --global user.name "Carlos Longarela Dev Machine 1"` and `# git config --global user.email "carlos+devm1@longarela.eu"` and check it with `# git config --list`

## Update Node and NPM
* Install n `# npm install -g n` From https://www.freecodecamp.org/news/how-to-update-node-and-npm-to-the-latest-version/
* Install the new version of Node `# n lts` and `# n latest`
* Remove previously installed versions `# n prune`

## Install Composer
* Install composer with `# apt install composer`