FROM	debian:buster

RUN		apt-get -y update
RUN		apt-get -y upgrade

RUN		apt-get -y install nginx
RUN		apt-get -y install openssl

RUN		openssl req -newkey rsa:4096 -days 365 -nodes -x509\
		-subj "/C=KR/ST=Seoul/O=42Seoul/OU=42Seoul/CN=localhost"\
		-keyout /etc/ssl/private/localhost.key\
		-out /etc/ssl/certs/localhost.crt &&\
		chmod 777 /etc/ssl/certs/localhost.crt /etc/ssl/private/localhost.key

# nginx config file 복사
COPY	./conf/default	/etc/nginx/sites-available/default

# nginx를 foreground로 실행
ENTRYPOINT	["nginx", "-g", "daemon off;"]
