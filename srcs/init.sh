# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ivanloisy <ivanloisy@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/25 17:23:44 by ivanloisy         #+#    #+#              #
#    Updated: 2021/04/29 01:05:54 by ivanloisy        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# cd
service php7.3-fpm start

service nginx start
service mysql start

# openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=emma/CN=localhost"

# echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root


# service mysql restart

ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
#ln -s /etc/nginx/sites-available/phpmyadmin /etc/nginx/sites-enable

echo "GRANT ALL ON *.* TO 'ivloisy'@'localhost' IDENTIFIED BY '123'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

service nginx restart
service php7.3-fpm restart