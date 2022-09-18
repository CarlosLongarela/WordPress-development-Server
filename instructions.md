# Instructions for development

## Install Development Tools

### 1 - PHP
Install PHP `# apt get PHP`

### 2 - Composer
If we installed previously with *apt*, deinstall it with `sudo apt remove composer`.

Update system packages: `# apt update`
Install dependencies: `# apt install php-cli unzip`
```
# cd ~
# curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
# HASH=`curl -sS https://composer.github.io/installer.sig`
# echo $HASH
# php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
# sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

### 3 - PHPCS
Install [phpcs](https://github.com/squizlabs/PHP_CodeSniffer)

```
# composer global require squizlabs/php_codesniffer
```

Add to *PATH* `~/.bashrc` or `~/.zshrc` with:
```
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
```
Reload *bash* `# source ~/.bashrc` or *zsh* `# source ~/.zshrc`

Check **phpcs** version `# phpcs --version`

Check **phpcs** installed standards with `# phpcs -i`

Create folder for *standards*
```
# cd ~
# mkir standards
```

### 4 - WordPress Coding Standards
Install [WordPress Coding Standards](https://github.com/WordPress/WordPress-Coding-Standards) rules

Clone *WordPress Coding Standards* and add it to *PHPCS* standards path and check it with `# phpcs -i`:

```
# cd ~
# cd standards
# git clone https://github.com/WordPress/WordPress-Coding-Standards wpcs
# phpcs --config-set installed_paths /root/standards/wpcs
```

### 5 - PHP Compatibility Coding Standard for PHP CodeSniffer
Install [PHP Compatibility Coding Standard](https://github.com/PHPCompatibility/PHPCompatibility) rules

Clone *PHP Compatibility Coding Standard* and add it to *PHPCS* standards path and check it with `# phpcs -i`:

```
# cd ~
# cd standards
# git clone https://github.com/PHPCompatibility/PHPCompatibility phpc
# phpcs --config-set installed_paths /root/standards/wpcs,/root/standards/phpc
```
### 6 - PHPCompatibilityWP for PHP CodeSniffer
Install [PHPCompatibilityWP](https://github.com/PHPCompatibility/PHPCompatibilityWP) rules

Clone *PHPCompatibilityWP* and add it to *PHPCS* standards path and check it with `# phpcs -i`:

```
# cd ~
# cd standards
# git clone https://github.com/PHPCompatibility/PHPCompatibilityWP phpcwp
# phpcs --config-set installed_paths /root/standards/wpcs,/root/standards/phpc,/root/standards/phpcwp
```

Change to *master* branch to avoid errors:
```
# git checkout master
```

### 7 - PHPCompatibilityParagonie for PHP CodeSniffer
Install [PHPCompatibilityParagonie](https://github.com/PHPCompatibility/PHPCompatibilityParagonie) rules

Clone *PHPCompatibilityParagonie* and add it to *PHPCS* standards path and check it with `# phpcs -i`:

```
# cd ~
# cd standards
# git clone https://github.com/PHPCompatibility/PHPCompatibilityParagonie phpcp
# phpcs --config-set installed_paths /root/standards/wpcs,/root/standards/phpc,/root/standards/phpcwp,/root/standards/phpcp
```

### 8 - PHPCSUtils
Install [PHPCSUtils](https://github.com/phpcsstandards/phpcsutils/) rules

Clone *PHPCSUtils* and add it to *PHPCS* standards path and check it with `# phpcs -i`:

```
# cd ~
# cd standards
# git clone https://github.com/phpcsstandards/phpcsutils/ phpcsu
# phpcs --config-set installed_paths /root/standards/wpcs,/root/standards/phpc,/root/standards/phpcwp,/root/standards/phpcp,/root/standards/phpcsu
```

### 9 - NVM (Node Version Manager)

Install [NVM](https://github.com/nvm-sh/nvm) and also use the command to update:

```
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
```

Check node version with `# node -v `

Check npm version with `# npm -v `


## Configurations

* Configure the editor with [EditorConfig](https://editorconfig.org/)
* Configure project *dot files* (check this repo https://github.com/CarlosLongarela/wp-dotfiles)
* Execute `$ npm install` in the root of the directory to install the dependencies. If *gulp* doesn't work try to execute `# npm link gulp --force`
* Execute `apt-get update & apt-get install libnotify-bin` to avoid notify-send error.

## Git Flow

1. For the Git flow we will use [gitflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) and work on the 'develop' branch
2. To *deploy* this repository has been set up in [Gitlab](https://gitlab.com) with CI/CD using the `.gitlab-ci.yml` file and to *deploy* the Staging server has been aliased **deploy** *(it is created in the repo config file, in .git/)*; so if we run `$ git deploy` the following sequence will run:

```
git push && git checkout master && git pull && git merge develop && git push && git checkout develop
```

* We send the current changes in the *develop* branch to the Git repo
* We're moving to the *master* branch
* We bring you the possible changes in the *master* branch (there should be no change)
* We merged the *develop* branch into the current *master* branch
* We send the current changes in the *master* branch to the Git repo (this is where the `.gitlab-ci.yml` action comes in and sends the changes via FTP to the staging server)
* We are switching back to the *develop* branch to continue working on the development branch.
npm install
