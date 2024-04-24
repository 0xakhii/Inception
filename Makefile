all : 
	bash srcs/requirements/tools/make_dir.sh
	docker-compose -f srcs/docker-compose.yml build && docker-compose -f srcs/docker-compose.yml up

clean:
	@echo "\033[1;32mStoping Containers..."
	@docker stop $$(docker ps -aq) || true &> /dev/null
	@echo "Deleting Containers..."
	@docker rm -f $$(docker ps -aq) || true &> /dev/null
	@echo "Deleting Images..."
	@docker rmi -f $$(docker images -aq) || true &> /dev/null
	@echo "Deleting Volumes..."
	@docker volume rm $$(docker volume ls -q) || true &> /dev/null
	@rm -rf /home/ojamal/data/wordpress
	@rm -rf /home/ojamal/data/mariadb
	@echo "All Done!\033[0;0m"
	

fclean: clean

up : 
	docker-compose -f srcs/docker-compose.yml up

down :
	docker-compose -f srcs/docker-compose.yml down

re : fclean all