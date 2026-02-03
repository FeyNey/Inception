FROM debian:bookworm

RUN	apt-get update && \
	apt install -y \
	php-fpm \
	php-mysql && \
	rm -rf /var/lib/apt/lists/*
	# php-mysqli \

RUN mkdir -p /var/www/wordpress

EXPOSE 9000

COPY ./tools/entrypoint.sh /entrypoint.sh
RUN	chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]