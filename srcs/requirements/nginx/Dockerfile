FROM debian:bookworm

#install nginx / openssl
RUN apt-get update && \
	 apt-get install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*

#create certifcat
RUN	mkdir -p etc/nginx/ssl && \
	openssl req -x509 -nodes \
	-out /etc/nginx/ssl/certificat.crt \
	-keyout /etc/nginx/ssl/certificat.key \
	-subj "/C=FR/ST=IDF/L=Perpignan/O=42/OU=42/CN=acoste.42.fr/UID=acoste"

# COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wordpress



EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]