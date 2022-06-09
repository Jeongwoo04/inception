DOCKER_COMPOSE_DIR	=	srcs/docker-compose.yml

# -f : 디렉토리 경로 설정 (기본값은 Makefile 디렉토리) / -d : 백그라운드에서 실행 / --build : 이미지 실행
all:
	docker-compose -f $(DOCKER_COMPOSE_DIR) up -d --build

re: clean all

# stop : 컨테이너 정지
stop:
	docker-compose -f $(DOCKER_COMPOSE_DIR) stop

clean: stop
	docker-compose -f $(DOCKER_COMPOSE_DIR) down

# ps : 컨테이너 목록 표시
ps:
	docker-compose -f $(DOCKER_COMPOSE_DIR) ps

.PHONY : all re stop clean ps
