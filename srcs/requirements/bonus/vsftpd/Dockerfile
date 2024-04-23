FROM debian:12

RUN apt update -y && apt upgrade -y

WORKDIR /var/www/html/

RUN apt install vsftpd -y &&\
	apt install ufw -y

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY conf/user_create.sh /

RUN mkdir -p /var/run/vsftpd/empty

RUN chown root:root /var/run/vsftpd/empty

RUN chmod 555 /var/run/vsftpd/empty

EXPOSE 21 20

CMD [ "/bin/bash", "/user_create.sh" ]