all : 
	mkdir -p /home/kali/data/mariadb
	mkdir -p /home/kali/data/wordpress
	docker-compose -f srcs/docker-compose.yml up --build

clean:
	@echo "\033[1;32mStoping Containers..."
	@docker stop $$(docker ps -aq) || true 2> /dev/null
	@echo "Deleting Containers..."
	@docker rm -f $$(docker ps -aq) || true 2> /dev/null
	@echo "Deleting Images..."
	

fclean: clean
	@docker rmi -f $$(docker images -aq) || true 2> /dev/null
	@echo "Deleting Volumes...\033[0;0m"
	@docker volume rm $$(docker volume ls -q) || true 2> /dev/null
	@sleep 2 && echo "\033[1;32mAll Done!\033[0;0m"
	@sudo rm -rf /home/kali/data/wordpress
	@sudo rm -rf /home/kali/data/mariadb
	@echo "\033[1;32mFull Cleaning!\033[0;0m"

up : 
	docker-compose -f srcs/docker-compose.yml up

down :
	docker-compose -f srcs/docker-compose.yml down

re : fclean all