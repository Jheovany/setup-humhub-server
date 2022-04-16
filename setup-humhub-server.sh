#!/bin/bash

echo "HumHub Server Setup"
echo "https://docs.humhub.org/docs/admin/installation"

sudo apt update
sudo apt install -y apache2
sudo apt install -y php php-cli php7.4-gd php7.4-mysql php7.4-curl php7.4-mbstring
sudo apt install -y mysql-server
#sudo mysql_secure_installation

FILE=humhub-1.10.3.tar.gz
FOLDER=humhub-1.10.3

if [ ! -f $FILE ]; then 
	wget https://www.humhub.com/download/package/$FILE
	tar xvfz $FILE
fi

if [ -d $FOLDER ]; then
	sudo mv $FOLDER /var/www/humhub
	sudo chown -R www-data:www-data /var/www/humhub
fi

# Configure Apache Server
sudo ufw allow 'Apache'
sudo cp humhub.conf /etc/apache2/sites-available/
sudo a2ensite humhub.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2

# Display hostname
hostname –I
