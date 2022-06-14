FROM debian:buster

RUN apt-get -y update &&\
	apt-get -y upgrade

RUN apt-get -y php-fpm
RUN	apt-get -y install php7.3
RUN	apt-get -y php-mysqli
RUN	apt-get -y mariadb-client
RUN	apt-get -y wget
RUN	apt-get -y curl

# wordpress client 설치 후 권한 설정 및 파일 옮기기
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
		chmod +x wp-cli.phar &&\
		mv wp-cli.phar /usr/local/bin/wp

# 설정한 config file 복사
COPY	./conf/www.conf	/etc/php/7.3/fpm/pool.d
# config dir의 wordpress.sh 를 / 에 복사
COPY	./conf/run.sh	/run.sh
RUN chmod +x run.sh
# wordpress.sh 실행
CMD	/run.sh
