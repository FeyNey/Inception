# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoste <acoste@student.42perpignan.fr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/01/22 14:31:02 by acoste            #+#    #+#              #
#    Updated: 2026/02/10 15:56:29 by acoste           ###   ########.fr        #
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

up:
	mkdir -p srcs/acoste/data/mariadb
	mkdir -p srcs/acoste/data/wordpress
	docker compose -f $(SRC) up --build -d
	docker compose up

down:
	docker compose -f $(SRC) down -v


# OBJ			=	$(SRC:.cpp=.o)

# all			:	$(NAME)

# %.o: %.cpp
# 	$(CC) $(CFLAGS) -c $< -o $@

# $(NAME)		:	$(OBJ)
# 	$(CC) $(CFLAGS) $(OBJ) -o $(NAME)

clean		: down
	sudo rm -rf srcs/acoste/data/mariadb/*
	sudo rm -rf srcs/acoste/data/wordpress/*

fclean		:	clean
	docker system prune -af --volumes
	sudo rm -rf srcs/acoste/data

# re			:	fclean all


.PHONY: all re clean fclean up down