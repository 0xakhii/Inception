FROM debian:12

RUN apt update -y && apt upgrade -y

RUN apt install nginx -y

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY conf/src/* var/www/html/

RUN chmod -R 777 /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]