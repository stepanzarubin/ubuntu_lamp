#!/usr/bin/env bash

#current stable, require at least php 5.6
curl -O https://phar.phpunit.de/phpunit.phar

## previous stable release, php 5.3 - 5.6
#this type of installation is broken right now
#curl -o phpunit.phar https://phar.phpunit.de/phpunit-old.phar

chmod +x phpunit.phar
sudo mv phpunit.phar /usr/local/bin/phpunit

##install via composer
#sudo composer global require "phpunit/phpunit=5.4.*"
#make sure you have ~/.composer/vendor/bin/ in your path
#export PATH=$PATH:/$HOME/.composer/vendor/bin/

#phpunit extra
#sudo composer global require 'phpunit/phpunit-selenium=*'
#sudo composer global require 'phpunit/dbunit=*'
#sudo composer global require 'phpunit/php-invoker=*'
