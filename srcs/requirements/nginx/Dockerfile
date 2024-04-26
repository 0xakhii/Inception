FROM debian:11

RUN apt update -y && apt upgrade -y

RUN	apt install nginx gettext openssl -y && \
	mkdir -p /etc/nginx/ssl/ && \
	chmod 755 /var/www/html &&chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /

CMD bash -c 'envsubst < /nginx.conf > /etc/nginx/conf.d/nginx.conf && \
	openssl req -x509 -nodes -out ${CERT} -keyout \
	${KEY} -subj "/" && nginx -g "daemon off;"'