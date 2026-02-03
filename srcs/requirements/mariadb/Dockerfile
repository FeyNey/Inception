FROM debian:bookworm

RUN apt-get update && \
	apt-get install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysql

COPY conf/config.cnf /etc/mysql/mariadb.conf.d/config.cnf

EXPOSE 3306

COPY /tools/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]