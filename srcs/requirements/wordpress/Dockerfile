FROM debian:buster

RUN apt-get update -y &&\
	apt-get upgrade -y

RUN	apt-get -y install php7.3\
	php-fpm\
	php-mysqli\
	mariadb-client\
	wget\
	curl

# wordpress client 설치 후 권한 설정 및 파일 옮기기
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
		chmod +x wp-cli.phar &&\
		mv wp-cli.phar /usr/local/bin/wp

# 설정한 config file 복사
COPY	./conf/www.conf	/etc/php/7.3/fpm/pool.d
# config dir의 wordpress.sh 를 / 에 복사
COPY	./conf/run.sh	/
# wordpress.sh 실행
CMD	./run.sh
