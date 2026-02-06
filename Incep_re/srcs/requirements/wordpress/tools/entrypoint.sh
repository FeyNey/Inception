#!/bin/bash

sed -i 's/listen = \/run\/php\/php.*-fpm.sock/listen = 9000/g' /etc/php/*/fpm/pool.d/www.conf

if [ ! -f /var/www/wordpress/wp-config.php ]; then

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	wp core download --allow-root --path=/var/www/wordpress

	# mariadb-client check if database is accapting connections
	until mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
		echo 'Waiting for MariaDB...'
		sleep 2
	done


	wp	config create --allow-root \
		--dbname="$MYSQL_DATABASE" \
		--dbuser="$WORDPRESS_DB_USER" \
		--dbpass="$WORDPRESS_DB_PASSWORD" \
		--dbhost="$WORDPRESS_DB_HOST"

	wp core install --allow-root \
		--path=/var/www/wordpress \
		--url="https://localhost" \
		--title="acoste_WEB" \
		--admin_user="$WORDPRESS_ADMIN" \
		--admin_password="$WORDPRESS_ADMIN_PASS" \
		--admin_email="acoste@42-perpignan.fr"

	# wp user create --allow-root \
	#	--path=/var/www/wordpress \
	#	"$WORDPRESS_USER" test@test.fr \
	#	--user_pass="$WORDPRESS_USER_PASS" \
	#	--role=subscriber

	chown -R www-data:www-data /var/www/wordpress

fi

if [ ! -d "/run/php" ]; then
	mkdir -p /run/php
fi

exec php-fpm8.2 -F