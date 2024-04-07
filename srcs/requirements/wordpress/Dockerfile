FROM debian:12

RUN apt update -y && apt upgrade -y

RUN apt install wget -y

RUN apt-get install -y php8.2 \
	php-fpm \
	php-mysql \
	mariadb-client

RUN wget https://wordpress.org/latest.zip -P /var/www

RUN apt install unzip -y

RUN cd /var/www && unzip latest.zip && rm -rf latest.zip

RUN chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/auto_conf.sh /home/

ENTRYPOINT [ "bash", "/home/auto_conf.sh" ]