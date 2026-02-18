# Dev Documentation — Inception

## Create environment variables

To start this project, you need to set you'r own environment variables in srcs

-> Create a .env
````sh
touch srcs/.env
````

	WORDPRESS_DB_HOST=mariadb
	WORDPRESS_DB_USER=wpuser
	WORDPRESS_DB_PASSWORD=wppassword
	WORDPRESS_ADMIN_PASS=changeme
	WORDPRESS_ADMIN=acoste
	WORDPRESS_USER=test
	WORDPRESS_USER_PASS=changeme
	MYSQL_DATABASE=wordpress
	MYSQL_ROOT_PASSWORD=rootpassword
	MYSQL_USER=wpuser
	MYSQL_PASSWORD=wppassword

If you actually need to build or relaunch the project you can use at the root of the project either

````sh
make or make re
````

````sh
docker compose down -v && docker system prune -af
docker compose build --no-cache && docker compose up
````
### Managing containers and volumes

You can use
````sh
docker ps
````
to check the status of your containers.

I recommand install lazydocker to help you having an interface on all your dockers it's beginner friendly and can help you understand more concept on it
https://github.com/jesseduffield/lazydocker.git

Beside that, use regular command of docker, down, system, build, up

### Data storage

All the data of the project will be stored through
````sh
/home/acoste/data/   path
````