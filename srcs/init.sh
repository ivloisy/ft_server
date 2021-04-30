# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ivanloisy <ivanloisy@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/25 17:23:44 by ivanloisy         #+#    #+#              #
#    Updated: 2021/04/30 02:17:55 by ivanloisy        ###   ########.fr        #
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
#echo "CREATE DATABASE wordpress;" | mysql -u root

service nginx restart
service php7.3-fpm restart

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
#wp core download --locale=fr_FR --force


# # admin email
# email="mon @ email.com"

# # local url login
# url="http://"$1":8888/"

# # admin login
# admin="admin-$1"

# # path to install your WPs
# pathtoinstall="~/Desktop"

# # path to plugins.txt
# pluginfilepath="~/path/to/wippy/plugins.txt"

cd /var/www/localhost
wp core download --locale=fr_FR --force --allow-root
wp core version --allow-root
wp core config --dbname=localhost --dbuser=ivloisy --dbpass=123 --skip-check --extra-php --allow-root <<PHP
define( 'WP_DEBUG', true );
PHP
wp db create --allow-root
# generate password
passgen=`head -c 10 /dev/random | base64`
password=${passgen:0:10}
# install
wp core install --url="http://localhost:8080/" --title="ft_server" --admin_user=ivloisy --admin_email=ivloisy@student.42.fr --admin_password=123 --allow-root