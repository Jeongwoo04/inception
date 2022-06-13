HOME_DIR	=	/home/jeson
YML_DIR		=	srcs/docker-compose.yml

# -f : 디렉토리 경로 설정 (기본값은 Makefile 디렉토리) / -d : 백그라운드에서 실행 / --build : 이미지 실행
all:
	chmod 777 /etc/hosts;
	@sudo echo '127.0.0.1 jeson.42.fr' >> /etc/hosts;
	@sudo echo '127.0.0.1 www.jeson.42.fr' >> /etc/hosts;
	@sudo mkdir -p $(HOME_DIR)/data
	@sudo mkdir -p $(HOME_DIR)/data/wordpress
	@sudo mkdir -p $(HOME_DIR)/data/mariadb
	docker-compose -f $(YML_DIR) up -d --build

re: clean all

# stop : 컨테이너 정지
stop:
	docker-compose -f $(YML_DIR) stop

clean: stop
	docker-compose -f $(YML_DIR) down;
	@docker volume rm $$(docker volume ls -q);
	sudo rm -rf $(HOME_DIR)/data;

# ps : 컨테이너 목록 표시
ps:
	docker-compose -f $(YML_DIR) ps

.PHONY : all re stop clean ps
