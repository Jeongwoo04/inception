FROM debian:buster

RUN apt-get update -y &&\
	apt-get upgrade -y

RUN	apt-get -y install php7.3\
	php-fpm\
	php-mysqli\
	mariadb-client\
	wget\
	curl

# wordpress 다운 & -P 지정한 장소에 설치
RUN mkdir -p /var/www
RUN	wget https://wordpress.org/wordpress-5.9.2.tar.gz -P /var/www

# wordpress 폴더로 이동 후 알집 풀고 정리
RUN	cd /var/www &&\
	tar -xvf wordpress-5.9.2.tar.gz &&\
	rm wordpress-5.9.2.tar.gz

# 설정한 config file 복사
COPY	./conf/www.conf	/etc/php/7.3/fpm/pool.d

# wordpress 로 /var/www/wordpress 소유권 주기
RUN	chown -R www-data:www-data /var/www/wordpress

# wordpress client 설치 후 권한 설정 및 파일 옮기기
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
		chmod +x wp-cli.phar &&\
		mv wp-cli.phar /usr/local/bin/wp

# config dir의 wordpress.sh 를 / 에 복사
COPY	./conf/run.sh	/
# wordpress.sh 실행
CMD	bash /run.sh
