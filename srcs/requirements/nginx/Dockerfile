FROM debian:buster

RUN	apt-get -y update &&\
	apt-get -y upgrade

RUN	apt-get -y install nginx\
	openssl

# 자체 서명 인증서 발급 (공인 or 사설 사용 x) / nginx에서 사용 가능하게 권한 설정
RUN		openssl req -newkey rsa:4096 -days 365 -nodes -x509\
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=42/CN=localhost"\
		-keyout /etc/ssl/private/localhost_p.key\
		-out /etc/ssl/certs/localhost.crt &&\
		chmod 777 /etc/ssl/certs/localhost.crt /etc/ssl/private/localhost_p.key

# COPY 명령어 -> 덮어쓰기
COPY	./conf/default	/etc/nginx/sites-available/default

# foreground로 실행
CMD	nginx -g daemon off
