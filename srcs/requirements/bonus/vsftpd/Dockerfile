FROM debian:11

WORKDIR /var/www/html/

RUN apt update -y && apt upgrade -y

RUN	apt install vsftpd -y && \
	mkdir -p /var/run/vsftpd/empty && \
	chown root:root /var/run/vsftpd/empty && \
	chmod 555 /var/run/vsftpd/empty

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY conf/user_create.sh /

CMD [ "/bin/bash", "/user_create.sh" ]