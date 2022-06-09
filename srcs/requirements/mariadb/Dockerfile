FROM	debian:buster

# Docker container build할 때 실행할 명령어
RUN	apt-get -y update &&\
	apt-get -y upgrade &&\
	apt-get -y install mariadb-server

# Host에 위치한 파일을 container 내부 특정 dir로 복사
COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/
COPY	tools/run.sh	/

# 복사한 run 실행
CMD	bash /run.sh
