sleep 10
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create	--allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWD \
    					--dbhost=mariadb:3306 --path='/var/www/wordpress'

sleep 2
wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$DB_USER --admin_password=$DB_PASSWD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
wp user create      --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt
fi