# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    run.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ivanloisy <ivanloisy@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/22 12:23:20 by ivanloisy         #+#    #+#              #
#    Updated: 2021/02/22 12:24:22 by ivanloisy        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

docker build -t test .
docker run --name caca -d -p 8080:80 test