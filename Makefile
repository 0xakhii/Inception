all : 
	bash srcs/requirements/tools/make_dir.sh
	docker-compose -f srcs/docker-compose.yml build && docker-compose -f srcs/docker-compose.yml up

clean:
	@echo "\033[1;32mStoping Containers..."
	@docker stop $$(docker ps -aq) || true 2> /dev/null
	@echo "Deleting Containers..."
	@docker rm -f $$(docker ps -aq) || true 2> /dev/null
	@echo "Deleting Images..."
	@docker rmi -f $$(docker images -aq) || true 2> /dev/null
	@echo "Deleting Volumes...\033[0;0m"
	@docker volume rm $$(docker volume ls -q) || true 2> /dev/null
	@sleep 2 && echo "\033[1;32mAll Done!\033[0;0m"
	

fclean: clean
	@sudo rm -rf /home/ojamal/data/wordpress
	@sudo rm -rf /home/ojamal/data/mariadb
	@echo "\033[1;32mFull Cleaning!\033[0;0m"

up : 
	docker-compose -f srcs/docker-compose.yml up

down :
	docker-compose -f srcs/docker-compose.yml down

re : fclean all