all : 
	bash srcs/requirements/tools/make_dir.sh
	docker-compose -f srcs/docker-compose.yml build && docker-compose -f srcs/docker-compose.yml up

clean:
	docker stop $$(docker ps -aq)
	docker rm -f $$(docker ps -aq)
	docker rmi -f $$(docker images -aq)
	docker volume rm $$(docker volume ls -q)
	rm -rf /home/$(USER)/data/wordpress
	rm -rf /home/$(USER)/data/mariadb
	

fclean: clean

up : 
	docker-compose -f srcs/docker-compose.yml up

down :
	docker-compose -f srcs/docker-compose.yml down

re : fclean all