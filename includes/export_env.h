/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   export_env.h                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: alde-oli <alde-oli@student.42lausanne.c    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/24 10:57:13 by alde-oli          #+#    #+#             */
/*   Updated: 2023/11/28 16:00:30 by alde-oli         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef EXPORT_ENV_H
# define EXPORT_ENV_H

t_export	*create_export(char *new, int is_export);
t_export	*export_add(t_export **first, char *new_exp, int is_export);
t_export	*export_remove(t_export **first, t_export *to_remove);
t_export	*export_find(t_export *first, char *key);
t_export	*export_modify(t_export **first, char *new);
t_export	**create_list(char **env);
t_export	*export_clear(t_export **first);
void		ft_split_export(char *new, char **k_v);

#endif