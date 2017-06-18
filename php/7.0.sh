#!/usr/bin/env bash

sudo apt-get -y install php7.0 php7.0-curl php7.0-gd php7.0-mcrypt php7.0-mysql php7.0-imap php7.0-json php7.0-xml php7.0-mbstring php7.0-zip php7.0-intl php7.0-bz2
sudo cp /usr/lib/php/7.0/php.ini-development /etc/php/7.0/apache2/php.ini

#enable modules
sudo phpenmod imap
