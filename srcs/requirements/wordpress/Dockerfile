FROM debian:12

RUN apt update -y && apt upgrade -y

WORKDIR /var/www/html/

RUN apt install wget -y


RUN apt-get install -y php \
	php-fpm \
	php-mysql

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /bin/

COPY conf/auto_conf.sh /home/

RUN chmod +x /home/auto_conf.sh

CMD [ "bash", "/home/auto_conf.sh" ]