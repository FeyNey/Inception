FROM debian:bookworm

RUN apt-get update && \
	apt-get install mariadb-server -y && \
	rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY ./tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


ENTRYPOINT ["/setup.sh"]