all : 
	sudo docker-compose -f srcs/docker-compose.yml build && sudo docker-compose -f srcs/docker-compose.yml up
down : 
	sudo docker-compose -f srcs/docker-compose.yml down && sudo rm -rf /home/kali/data/wordpress/* && sudo rm -rf /home/kali/data/mariadb/*

up :
	sudo docker-compose -f srcs/docker-compose.yml up