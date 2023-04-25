FROM postgres:latest AS db

ENV POSTGRES_HOST_AUTH_METHOD=trust

FROM db AS compilado

COPY words.sql /docker-entrypoint-initdb.d/

#No pude bajar el tamaño de esta imagen