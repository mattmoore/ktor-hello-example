FROM openjdk:8

RUN apt-get update \
 && apt-get install -y nginx


###############
# Nginx Proxy #
###############
COPY ./nginx.conf /etc/nginx/sites-enabled/default


###############
# Ktor Server #
###############
RUN mkdir /app
# Application jar
COPY ./build/libs/ktor-hello-example-all.jar /app/ktor-hello-example-all.jar


##############
# Entrypoint #
##############
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["sh", "/usr/local/bin/docker-entrypoint.sh"]
