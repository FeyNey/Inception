#!/bin/bash

# service mysql start

if [ ! -d "/var/lib/mysql/mysql" ]; then
	service mariadb start

	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > config.sql
	echo "CREATE USER IF NOT EXISTS '$MYSQL8USER'@'localhost' IDENTIFIER BY 'MYSQL_PASSWORD';" >> config.sql
	echo "GRANT ALL PRIVILEGES ON *.* TO $MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> config.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" >> config.sql
	mysql -p$MYSQL_ROOT_PASSWORD < config.sql

	kill $(cat /var/run/mysqld/mysqld.pid)
fi

exec mysqld