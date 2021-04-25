# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ivanloisy <ivanloisy@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/25 17:11:22 by ivanloisy         #+#    #+#              #
#    Updated: 2021/04/25 17:26:04 by ivanloisy        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update -yq \
&& apt-get upgrade -y
RUN apt-get install nginx -y

COPY ./srcs/init.sh ./

CMD bash init.sh \
&& tail -f /dev/null