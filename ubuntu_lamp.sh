#!/usr/bin/env bash

#curl
sudo apt-get -y install curl

#for compiling/installing things
sudo apt-get -y install build-essential checkinstall software-properties-common

#mariadb-server repository
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://lon1.mirrors.digitalocean.com/mariadb/repo/10.1/ubuntu xenial main'

#php repository
sudo apt-get -y install language-pack-en-base
sudo LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php

#update
sudo apt-get update

### SOFTWARE ###

#apache
sudo apt-get -y install apache2 libapache2-mod-php7.0 

#php 7.0
./php/7.0.sh

#composer
#./php/composer.sh

#phpunit
#./php/phpunit.sh

#mariadb
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
sudo apt-get -y install mariadb-server

#mariadb config (not if path will work)
#sudo mysql -uroot -proot -e "source ./mariadb/config.sql;"

### BASIC CONFIG ###

#apache
#create logs directory
sudo mkdir /etc/apache2/logs/
#create ssl directory
sudo mkdir /etc/apache2/ssl/

#enable rewrite, ssl mods
sudo service apache2 stop
sudo a2enmod rewrite
sudo a2enmod ssl

#user public_html directory (allows to keep all websites under ~/public_html/)
mkdir ~/public_html
sudo a2enmod userdir
sudo usermod -a -G `whoami` www-data
##end

sudo service apache2 start
#start on boot
sudo update-rc.d -f apache2 remove
sudo update-rc.d apache2 defaults

#config
sudo cp ./apache/apache2.conf /etc/apache2/
sudo cp ./php/php7.0.ini /etc/php/7.0/apache2/php.ini
sudo cp ./mariadb/my.cnf /etc/mysql/
sudo service apache2 restart
sudo service mysql restart


#cleanup
sudo apt-get -y autoremove

#upgrade
sudo apt-get -y upgrade
echo "Finish"
### END ###
