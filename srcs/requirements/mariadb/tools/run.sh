# db 설정

# dir 만들어져있지 않을때 실행
if [ ! -d /var/lib/mysql/$WP_DB_NAME ]; then
	# mysql 시작
	service mysql start
	mysql -e "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;"
	# @'%' -> 외부와 통신 가능
	mysql -e "CREATE USER '$DB_ADMIN_NAME'@'%' IDENTIFIED BY '$DB_ADMIN_PASSWORD';"
	# 모든 권한 부여 / bind-address 설정 없어도 해당 계정은 모든 ip에서 접근 가능
	mysql -e "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$DB_ADMIN_NAME'@'%';"
	# @'localhost' -> 외부와 통신 불가
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PW';"
	# 변경사항 적용
	mysql -e "FLUSH PRIVILEGES;"
	service mysql stop
fi
if [ -d /var/lib/mysql/$WP_DB_NAME ]; then
	cd /var/run
	mkdir mysqld
	chown mysql mysqld
	chgrp mysql mysqld
	systemctl restart mysql
fi
# sleep 3
# mariadb foreground 실행 / background로 실행은 & 옵션 사용
exec mysqld_safe
