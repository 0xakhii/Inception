#!/bin/bash
useradd -m -p $FTP_PASSWD $FTP_USER
echo "$FTP_USER:$FTP_PASSWD" | chpasswd
usermod -aG $FTP_GROUP $FTP_USER
echo $FTP_USER > /etc/vsftpd.userlist
mkdir -p /var/run/vsftpd/empty
vsftpd /etc/vsftpd.conf