/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils_shell.h                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dvandenb <dvandenb@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/13 11:48:42 by dvandenb          #+#    #+#             */
/*   Updated: 2023/11/30 16:43:13 by dvandenb         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef UTILS_SHELL_H
# define UTILS_SHELL_H
# include "minishell.h"

/**
 * @brief Given an error message, write it in the correct format
 * @note minishell: <error-message>
 * @param s 
 * @return int 
 */
int	ewrite(char *s);

int	e_token_write(char *s, char *expec);

int	exit_shell(int code, char *error);

int	ft_perror(char *mess);

int	fdwrite(int fd, char *s);

#endif