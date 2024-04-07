#!/bin/bash
wp-cli.phar core download --allow-root
wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb --allow-root
wp-cli.phar core install --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user='root' --admin_password=$DB_PASSWD --admin_email=$ADMIN_EMAIL --allow-root
wp-cli.phar user create $USER1_LOGIN $USER1_MAIL --role=subscriber --user_pass=$USER1_PASS --allow-root
php-fpm8.2 -F -R