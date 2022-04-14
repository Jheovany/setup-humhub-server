#!/bin/bash

echo "HumHub Server Setup"
echo "https://docs.humhub.org/docs/admin/installation"

sudo apt update
sudo apt install -y apache2
sudo apt install -y php php-cli php7.4-gd php7.4-mysql php7.4-curl php7.4-mbstring php7.4-zip php7.4-intl
sudo systemctl restart apache2
#sudo apt install -y mysql-server
#sudo mysql_secure_installation

FILE=humhub-1.10.3.tar.gz
FOLDER=humhub-1.10.3

if [ ! -f $FILE ]; then 
	wget https://www.humhub.com/download/package/$FILE
	tar xvfz $FILE
fi

if [ -f $FOLDER ]; then
	sudo mv $FOLDER /var/www/humhub
	sudo chown -R www-data:www-data /var/www/humhub
fi
