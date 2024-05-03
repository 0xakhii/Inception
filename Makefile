all : 
	mkdir -p /home/kali/data/mariadb
	mkdir -p /home/kali/data/wordpress
	docker-compose -f srcs/docker-compose.yml up -d --build

build :
	docker-compose -f srcs/docker-compose.yml build
stop :
	docker-compose -f srcs/docker-compose.yml stop
logs :
	docker-compose -f srcs/docker-compose.yml logs
clean:
	@echo "\033[1;32mStoping Containers..."
	@docker stop $$(docker ps -aq) || true 2> /dev/null
	@echo "Deleting Containers..."
	@docker rm -f $$(docker ps -aq) || true 2> /dev/null

fclean: clean
	@sudo rm -rf /home/kali/data/wordpress
	@sudo rm -rf /home/kali/data/mariadb
	@echo "Deleting Images..."
	@docker rmi -f $$(docker images -aq) || true 2> /dev/null
	@echo "Deleting Volumes...\033[0;0m"
	@docker volume rm $$(docker volume ls -q) || true 2> /dev/null
	@sleep 2 && echo "\033[1;32mAll Done!\033[0;0m"
	@echo "\033[1;32mFull Cleaning!\033[0;0m"

up : 
	docker-compose -f srcs/docker-compose.yml up

down :
	docker-compose -f srcs/docker-compose.yml down

re : fclean all