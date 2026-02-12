#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
fi

mysqld_safe --skip-networking &
MYSQL_PID=$!

until mysqladmin ping --silent; do
    echo "Waiting for MariaDB to start..."
    sleep 3
done

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF



echo "MariaDB initialized successfully"

mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
wait $MYSQL_PID

exec mysqld_safe --bind-address=0.0.0.0


# if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then

# 	service mariadb start

# 	mysql -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;"
# 	mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# 	mysql -e "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';"
# 	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
# 	mysql -e "FLUSH PRIVILEGES;"

# 	kill $(cat /var/run/mysqld/mysqld.pid)

# 	echo "Database setup complete!"
# else
# 	echo "Database already exists, skipping setup."
# fi