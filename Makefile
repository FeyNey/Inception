# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoste <acoste@student.42perpignan.fr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/01/22 14:31:02 by acoste            #+#    #+#              #
#    Updated: 2026/02/17 21:46:50 by acoste           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoste <acoste@student.42perpignan.fr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/12/20 01:50:44 by acoste            #+#    #+#              #
#    Updated: 2025/12/20 01:50:57 by acoste           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# CC			=	cc

# CFLAGS		=	-g -Wall -Werror -Wextra

NAME		=	Inception

SRC	=	srcs/docker-compose.yml

all: up

up:
	mkdir -p /home/acoste/data/mariadb
	mkdir -p /home/acoste/data/wordpress
	docker compose -f $(SRC) up --build

down:
	docker compose -f $(SRC) down -v

clean		:	down
	sudo rm -rf /home/acoste/data/mariadb
	sudo rm -rf /home/acoste/data/wordpress

fclean		:	clean
	docker system prune -af --volumes

re	:	fclean	all

.PHONY: all re clean fclean up down