#!/bin/bash

sudo mkdir -p /home/jeson/data/wordpress
sudo mkdir -p /home/jeson/data/mariadb

if [ ! -e /etc/pre-work.txt ]; then
	sudo touch /etc/pre-work.txt
	sudo chmod 777 /etc/hosts;
	sudo echo '127.0.0.1 jeson.42.fr' >> /etc/hosts;
	sudo echo '127.0.0.1 www.jeson.42.fr' >> /etc/hosts;
fi
