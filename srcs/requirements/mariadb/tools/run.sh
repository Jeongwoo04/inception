#!/bin/sh
# db 설정

# dir 만들어져있지 않을때 실행
if [ ! -d /var/lib/mysql/$WP_DB_NAME ]; then
	# mysql 시작
	service mysql start
	mysql -e "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;"
	# @'%' -> host를 %로 주면 모든 외부 ip에서 접속 가능
	mysql -e "CREATE USER '$DB_ADMIN_NAME'@'%' IDENTIFIED BY '$DB_ADMIN_PASSWORD';"
	# 모든 권한 부여
	mysql -e "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$DB_ADMIN_NAME'@'%';"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PW';"
	# 변경사항 적용
	mysql -e "FLUSH PRIVILEGES;"
	service mysql stop
fi

# mariadb foreground 실행 / background로 실행은 & 옵션 사용
exec mysqld_safe
