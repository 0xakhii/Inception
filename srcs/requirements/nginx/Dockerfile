FROM debian:12

RUN apt update -y && apt upgrade -y

RUN apt install nginx -y

RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl/

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/self.crt -keyout \
	/etc/nginx/ssl/self.key -subj "/C=MO/L=BG/O=1377/CN=ojamal.42.fr/UID=ojamal"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]