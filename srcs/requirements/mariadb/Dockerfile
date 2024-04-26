FROM debian:11

COPY ./conf/create_db.sh /

RUN apt update -y && apt upgrade -y

RUN	apt install mariadb-server -y && \
chmod +x /create_db.sh

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT [ "bash", "create_db.sh" ]