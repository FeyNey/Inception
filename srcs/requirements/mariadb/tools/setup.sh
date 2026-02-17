#!/bin/bash

if [ ! -f "/var/lib/mysql/$MYSQL_DATABASE" ]; then

	mysqld_safe --skip-networking > /dev/null 2>&1 &
	MYSQL_PID=$!

	echo "=== Cheaking initialisation ==="
	until mysqladmin ping --silent; do
		echo "Waiting for MariaDB to start..."
		sleep 3
	done

	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > setup.sql
	echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';" >> setup.sql
	echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> setup.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" >> setup.sql
	mysql -p$MYSQL_ROOT_PASSWORD < setup.sql

	mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
	wait $MYSQL_PID

	echo '=== Initialisation done ==='
fi

echo "=== Starting MariaDB ==="
exec mysqld_safe --bind-address=0.0.0.0

