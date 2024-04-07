#!/bin/bash
service mariadb start
mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -e "CREATE user IF NOT EXISTS $DB_USER IDENTIFIED BY '$DB_PASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER;"
mariadb -e "FLUSH PRIVILEGES;"
service mariadb stop
mariadbd
