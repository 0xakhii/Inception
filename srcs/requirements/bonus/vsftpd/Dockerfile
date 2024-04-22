FROM debian:12

RUN apt update -y && apt upgrade -y

RUN apt install vsftpd -y &&\
	apt install ufw -y

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY conf/user_create.sh /

