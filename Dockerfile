# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ivanloisy <ivanloisy@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/25 17:11:22 by ivanloisy         #+#    #+#              #
#    Updated: 2021/04/29 01:24:30 by ivanloisy        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update -yq \
&& apt-get upgrade -y
RUN apt-get install openssl -y
RUN apt-get install nginx -y
RUN apt-get install php7.3 php7.3-fpm php7.3-gd php7.3-mysql php7.3-curl php7.3-imap php7.3-mbstring php7.3-xml php7.3-cgi php7.3-zip php7.3-gettext php-pear -y
RUN apt-get install mariadb-server mariadb-client -y
RUN apt-get install wget -y
RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz

# RUN mkdir /etc/nginx/ssl
RUN mkdir -p /var/www/localhost/phpmyadmin

RUN tar xvf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/localhost/phpmyadmin

COPY ./srcs/init.sh ./
COPY ./srcs/localhost /etc/nginx/sites-available
#COPY ./srcs/phpmyadmin /etc/nginx/sites-available
# COPY ./srcs/nginx.conf /etc/nginx
COPY ./srcs/index.html /var/www/localhost
COPY ./srcs/phpinfo.php /var/www/localhost
COPY ./srcs/config.inc.php /var/www/localhost/phpmyadmin/config.inc.php

RUN chmod 660 /var/www/localhost/phpmyadmin/config.inc.php
RUN chown -R www-data:www-data /var/www/localhost/phpmyadmin

EXPOSE 8080

CMD bash init.sh \
&& tail -f /dev/null