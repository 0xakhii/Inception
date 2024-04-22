#!/bin/bash

adduser -h /var/www/html/ -s /bin/false -D $FTP_USER;
echo "$FTP_USER:$FTP_PASSWD" | /usr/sbin/chpasswd;
adduser $FTP_USER root;
vsftpd /etc/vsftpd/vsftpd.conf