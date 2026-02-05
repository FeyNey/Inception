FROM debian:bookworm

RUN apt-get update

RUN apt-get install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld /var/log/mysql /var/lib/mysql && \
	chown -R mysql:mysql /var/run/mysqld /var/log/mysql /var/lib/mysql && \
	chmod 755 /var/run/mysqld /var/log/mysql

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY /tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3306


ENTRYPOINT ["/entrypoint.sh"]