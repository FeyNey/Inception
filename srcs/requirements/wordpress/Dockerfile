FROM debian:bookworm

RUN	apt-get update && \
	apt install -y \
	php-fpm \
	php-mysql \
	wget \
	mariadb-client && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/wordpress && \
	chown -R www-data:www-data /var/www/wordpress
# RUN	chmod +x /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY ./tools/entrypoint.sh /entrypoint.sh
RUN	chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]