#!/bin/bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install php71
brew install php71-xdebug

brew install composer
composer global require laravel/valet
valet install
mkdir ~/Sites
cd Sites
valet park

brew install mariadb
brew services start mariadb

brew install php-code-sniffer
brew install php-cs-fixer
brew install wp-cli

brew install git
# brew cask install sourcetree

brew cask install sublime-text
# brew cask install phpstorm

brew install node
npm i -g node-sass postcss-cli autoprefixer

brew cask install poedit

brew cask install filezilla
brew cask install flux
brew cask install google-chrome
brew cask install firefox

# brew cask install skype
# brew cask install spectacle
