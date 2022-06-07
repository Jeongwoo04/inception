NAME = inception

YML = docker-compose
SRC_DIR = src

RM = rm
RMFLAGS = -f

GREEN = \033[32m
PURPLE = \033[35m
MINT = \033[36m
RED = \033[31m
BLINK = \033[5m
BOLD = \033[1m
BACKGRAY = \033[100m
NO_COLOR = \e[0m

make :
	@echo "${PURPLE}[${RED} Docker Composer${PURPLE} :starting.. ]"
	@echo "${PURPLE}->making $(NAME).."
	@$(YML) up -d
	@echo "${PURPLE}->resting.. drinking some coffee..."
	@echo "${MINT}making Done."

stop :
	@echo "${PURPLE}[${RED} docker stop ${PURPLE} : stop all container.]"
	@$(YML) down
	@echo "${PURPLE}->kill every container.."
	@echo "${PURPLE}->close all container's door..."
	@echo "${MINT}stopping Done."

ls :
	@echo "${PURPLE}[${RED} Running container List ${PURPLE}]"
	@$(YML) ps
	@($(RM) $(RMFLAGS) $(NAME))

log :
	@echo "${PURPLE}[${RED} Running container Logs ${PURPLE}]"
	@$(YML) logs
	@($(RM) $(RMFLAGS) $(NAME))

re :
	@echo "${PURPLE}[${RED} Restart Docker composer${PURPLE} :Restarting.. ]"
	@echo "${PURPLE}->remaking $(NAME).."
	@$(YML) up --force-recreate -d
	@echo "${PURPLE}->resting.. drinking some coffee..."
	@echo "${MINT}restarting Done."
