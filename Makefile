# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dvandenb <dvandenb@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/30 18:04:17 by dvandenb          #+#    #+#              #
#    Updated: 2023/11/30 18:04:21 by dvandenb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CFILES	:= verify_input.c utils.c utils_shell.c main.c logic.c list_utils2.c list_utils.c \
history.c builtin.c builtin2.c create_tokens.c wildcards.c convert_env.c commands.c pipe.c \
wildcards2.c verify_input2.c pipe2.c commands2.c convert_env2.c export_env.c export_env2.c builtin3.c
RM		:= rm -f
NAME	:= minishell
CC		:= gcc
INCDIR	:= -I includes -I libft
RL_LIB	:= -lreadline

# macOS: readline from Homebrew (system libedit lacks rl_replace_line)
ifeq ($(shell uname -s),Darwin)
RL_DIR	:= $(shell brew --prefix readline 2>/dev/null || echo $(HOME)/.brew/opt/readline)
INCDIR	+= -I $(RL_DIR)/include
RL_LIB	:= -L$(RL_DIR)/lib -lreadline
endif

LIB		:= libft.a
LIBDIR	:= libft
LIBPATH	:= $(LIBDIR)/$(LIB)
CFLAGS	:= -Wall -Wextra -Werror $(INCDIR)
# make SAN=1 builds with AddressSanitizer
ifdef SAN
CFLAGS	+= -g -fsanitize=address
endif

all: $(NAME)

$(NAME): $(CFILES) $(LIBPATH)
	$(CC) $(CFLAGS) $(CFILES) -o $(NAME) $(LIBPATH) $(RL_LIB)

$(LIBPATH):
	make -C $(LIBDIR)

clean:
	make -C $(LIBDIR) clean

fclean: clean
	$(RM) $(LIBPATH)
	make -C $(LIBDIR) clean
	$(RM) $(NAME)

re: fclean all

run: all
	./minishell

leaks: all
	leaks --atExit -- ./minishell

.PHONY: clean fclean all re run

