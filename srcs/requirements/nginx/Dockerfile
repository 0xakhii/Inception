FROM debian:11

RUN apt update -y && apt upgrade -y && \
	apt install nginx openssl gettext-base -y && \
	mkdir -p /etc/nginx/ssl/ && chmod 755 /etc/nginx/ssl && \
	chmod 755 /var/www/html && \
	chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /

CMD bash -c 'envsubst < /nginx.conf > /etc/nginx/conf.d/nginx.conf \ 
			&& openssl req -x509 -nodes -out \
			"/etc/nginx/ssl/self.cert" -keyout "/etc/nginx/ssl/self.key" -subj "/"\
			 && nginx -g "daemon off;"'