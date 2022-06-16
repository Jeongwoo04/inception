#!/bin/bash

if [ ! -e /var/www/wordpress/wp-config.php ]; then
	# wp-config.php file 만들기 / --allow-root 관리자 권한 허용
	mkdir -p /var/www/wordpress
	wp core download --allow-root --version=5.9.1 --path='/var/www/wordpress'
	chown -R www-data:www-data /var/www/wordpress

	wp config create --allow-root --dbname=$WP_DB_NAME --dbuser=$DB_ADMIN_NAME\
					--dbpass=$DB_ADMIN_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
	# wordpress 세팅
	wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER1_NAME\
					--admin_password=$WP_USER1_PASSWORD --admin_email=$WP_USER1_MAIL --path='/var/www/wordpress'
	wp user create --allow-root $WP_USER2_NAME $WP_USER2_MAIL --user_pass=$WP_USER2_PASSWORD --role=author\
					--path='/var/www/wordpress'
fi

# -F Force to stay in foreground and ignore daemonize option from configuration file.
mkdir -p /run/php/
/usr/sbin/php-fpm7.3 -F

# user 확인하기
# wp user list --allow-root
