# User Documentation — Inception

## 1. Project Overview

This project deploys a complete web stack using Docker and Docker Compose.
The stack provides the following services:

- **Nginx**: Web server acting as a reverse proxy with TLS
- **WordPress**: Website and CMS
- **MariaDB**: Database used by WordPress

All services run inside isolated Docker containers and communicate over a
private Docker network.

---

## Starting and Stopping the Project

### Start the project
From the root of the repository:

````sh
make
````

### Stop the project

````sh
make down
````

### Stop the project

````sh
make fclean
````

## Accessing the Website and Admin Panel

For accessing website you need to use either localhost by default or acoste.42.fr if you wan't to use it, add this line to your /etc/hosts file for your browser to recognise it
````sh
127.0.0.1    acoste.42.fr
````

Open your favorite browser, search address localhost or https://acoste.42.fr and their we go, you have now launch into my wordpress site welcome ! Nothing crasy to see though

If you wan't to acces admin panel goes to
````sh
https://acoste.42.fr/wp-admin or https://localhost/wp-admin
````

### Checking Service Status

````sh
docker ps
````

### Check Container logs

````sh
docker logs nginx
docker logs wordpress
docker logs mariadb
````



