# WordPress development Server

## Install server

* Create the droplet on Vultr, Digital Ocean, etc. with 4GB RAM approximately
* Connect to server `# ssh root@11.22.33.44`
* Update server with `# apt update && apt upgrade`

## Configure i with the base system (Gridpane)

* Create server from GridPane.

## Configure base tools
* Install ZSH `# apt install zsh`
* Install Powerline fonts `# apt install fonts-powerline`
* Install Oh My ZSH `# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` 

## Update Node and NPM
* Install n `# npm install -g n` From https://www.freecodecamp.org/news/how-to-update-node-and-npm-to-the-latest-version/
* Install the new version of Node `# n lts` and `# n latest`
* Remove previously installed versions `# n prune`
