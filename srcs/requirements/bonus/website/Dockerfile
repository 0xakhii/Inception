FROM debian:12

RUN apt update -y && apt upgrade -y

RUN apt install php -y

RUN mkdir -p /php_server

WORKDIR /php_server

COPY ./conf/ /php_server/

CMD [ "php", "-S", "0.0.0.0:80" ]