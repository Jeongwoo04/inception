HOME_DIR	=	/home/jeson
YML_DIR		=	srcs/docker-compose.yml
TOOL_DIR	=	srcs/requirements/tools

# -f : 디렉토리 경로 설정 (기본값은 Makefile 디렉토리) / -d : 백그라운드에서 실행 / --build : 이미지 실행
all:
	$(TOOL_DIR)/pre-work.sh
	sudo docker-compose -f $(YML_DIR) up -d --build

re: clean all

# stop : 컨테이너 정지
stop:
	sudo docker-compose -f $(YML_DIR) stop

down:
	sudo docker-compose -f $(YML_DIR) down;

clean: down
	sudo docker system prune -af
	sudo docker volume rm $$(sudo docker volume ls -q)
	sudo rm -rf /home/jeson/data

.PHONY : all re stop down clean
