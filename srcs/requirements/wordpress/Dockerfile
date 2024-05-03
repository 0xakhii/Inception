FROM debian:11

WORKDIR /var/www/html/

COPY conf/auto_conf.sh /home/

RUN apt update -y && apt upgrade -y && \
	apt install -y php wget \
	php-fpm \
	php-mysql && \ 
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /bin/ && \
	chmod +x /home/auto_conf.sh

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf


CMD [ "bash", "/home/auto_conf.sh" ]