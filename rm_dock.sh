#!/bin/bash
# 사용하지 않는 docker 오브젝트 전부 삭제
docker system prune -af
# host local 저장소 삭제
sudo rm -rf /home/jeson/data
