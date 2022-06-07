sed -i "s/database_name_here/$DB/g" /var/www/html/wp-config.php; 
sed -i "s/username_here/$USER_NAME/g" /var/www/html/wp-config.php; 
sed -i "s/password_here/$USER_PASSWORD/g" /var/www/html/wp-config.php; 
sed -i "s/localhost/$DB_KIND/g" /var/www/html/wp-config.php;

/usr/sbin/php-fpm7.3;