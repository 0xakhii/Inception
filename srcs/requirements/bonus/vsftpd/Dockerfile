FROM debian:12

RUN apt update -y && apt upgrade -y

WORKDIR /var/www/html/

RUN apt install vsftpd -y &&\
	apt install ufw -y

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY conf/user_create.sh /

CMD [ "/bin/bash", "/user_create.sh" ]