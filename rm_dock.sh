#!/bin/bash

docker container stop $(docker ps -aq)

# 모든 images 삭제
docker rmi -f $(docker images)

# 모든 containers 삭제
docker rm -f $(docker ps -aq)

# docker volumes 삭제
docker volume rm $(docker volume ls -q)

# 사용하지 않는 docker 오브젝트 전부 삭제
docker system prune
