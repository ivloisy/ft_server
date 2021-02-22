# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ivanloisy <ivanloisy@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/11 14:40:56 by ivanloisy         #+#    #+#              #
#    Updated: 2021/02/12 13:57:52 by ivanloisy        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update -yq \
&& apt-get upgrade -y
RUN apt-get install php -y
RUN apt-get install nginx -y
RUN apt-get install mariadb-server -y

COPY ./srcs/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD service nginx start -g daemon off \
&& tail -f /dev/null