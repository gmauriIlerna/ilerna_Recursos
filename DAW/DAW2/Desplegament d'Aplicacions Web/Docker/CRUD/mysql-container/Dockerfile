FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=usersdb
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=1234

COPY init.sql /docker-entrypoint-initdb.d/
