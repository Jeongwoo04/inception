FROM debian:buster

# ARG USER_NAME=jeson
# ARG USER_PASSWORD=0000
# ARG DB=wordpress_db
# ARG DB=mariadb
ARG NGINX_REQUIREMENTS="nginx openssl vim"

RUN apt-get update -y && apt-get upgrade -y;  \
    apt-get -y install ${NGINX_REQUIREMENTS}; \
    apt-get -y install dumb-init

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=jeson/CN=jeson.42.fr" \
    -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt;


COPY ./default /etc/nginx/sites-available/
# COPY ./nginx.conf /etc/nginx/nginx.conf
# RUN cp /default /etc/nginx/sites-available/default;

ENTRYPOINT [ "/usr/bin/dumb-init" ]

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
