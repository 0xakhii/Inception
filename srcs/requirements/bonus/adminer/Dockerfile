FROM debian:11

WORKDIR /var/www/

RUN apt update -y && apt upgrade -y && \
	apt install php php-mysql -y && \
	apt install wget -y && \
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
	mv adminer-4.8.1.php index.php

CMD [ "php" , "-S" , "[::]:7070" ]