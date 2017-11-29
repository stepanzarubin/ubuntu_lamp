#!/usr/bin/env bash

sudo apt-get -y install php5 php5-curl php5-gd php5-mcrypt php5-mysql php5-sqlite3 php5-imap php5-json php5-intl
sudo cp /usr/share/php5/php.ini-development /etc/php5/apache2/php.ini

#enable modules
sudo php5enmod imap
