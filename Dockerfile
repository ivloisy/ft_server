# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ivanloisy <ivanloisy@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/25 17:11:22 by ivanloisy         #+#    #+#              #
#    Updated: 2021/04/27 23:46:26 by ivanloisy        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update -yq \
&& apt-get upgrade -y
RUN apt-get install openssl -y
RUN apt-get install nginx -y
RUN apt-get install php php-fpm php-mysql php-mbstring php-cgi php-xml php-gd php-gettext php-cli -y
RUN apt-get install mariadb-server mariadb-client -y
RUN apt-get install wget -y
RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz

RUN mkdir /etc/nginx/ssl
RUN mkdir -p /var/www/localhost/phpmyadmin

RUN tar xvf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/localhost/phpmyadmin

COPY ./srcs/init.sh ./
COPY ./srcs/nginx.conf /etc/nginx
COPY ./srcs/index.html /var/www/localhost
COPY ./srcs/phpinfo.php /var/www/localhost
COPY ./srcs/config.inc.php /var/www/localhost/phpmyadmin/config.inc.php

RUN chmod 660 /var/www/localhost/phpmyadmin/config.inc.php
RUN chown -R www-data:www-data /var/www/localhost/phpmyadmin

CMD bash init.sh \
&& tail -f /dev/null