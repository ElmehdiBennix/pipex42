# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ebennix <ebennix@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/06 21:17:21 by ebennix           #+#    #+#              #
#    Updated: 2023/02/23 19:28:58 by ebennix          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

EXE := pipex

CC := cc

CFLAGS := -g -Wall -Wextra -Werror

HEADER := pipex.h

FILES := pipex \
		utils/pipex_utils \
		utils/ft_split \
		ft_printf/utils/ft_printf_hex \
		ft_printf/utils/ft_printf_put \
		ft_printf/ft_printf \

SRC := $(FILES:=.c)
OBJ := $(SRC:.c=.o)

RM := rm -rf

m := "MakefileAutoPush"

# **************************************************************************** #

all : $(EXE)

$(EXE) : $(OBJ)
	$(CC) $(OBJ) -o $(EXE)

%.o : %.c $(HEADER)
	$(CC) $(CFLAGS) -c $< -o $@

clean :
	$(RM) $(OBJ)

fclean : clean
	$(RM) $(EXE)

re : fclean all

push :
	git add .
	git status
	git commit -m "$(m)"
	git push

# **************************************************************************** #

.PHONY : all clean fclean re push
