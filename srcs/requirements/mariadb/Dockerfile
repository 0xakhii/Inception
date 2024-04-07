FROM debian:12

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/create_db.sh /

RUN chmod +x /create_db.sh

ENTRYPOINT [ "bash", "create_db.sh" ]