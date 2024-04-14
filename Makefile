all : 
	sudo docker-compose -f srcs/docker-compose.yml build && sudo docker-compose -f srcs/docker-compose.yml up
down : 
	sudo docker-compose -f srcs/docker-compose.yml down

up :
	sudo docker-compose -f srcs/docker-compose.yml up