FROM alpine:3.6

LABEL maintainer="peter@kracik.sk"

RUN apk update; \
    apk upgrade;

RUN apk add mysql-client gzip bash

ENV MYSQL_DATABASE database
ENV MYSQL_USER root
ENV MYSQL_PASSWORD password
ENV MYSQL_HOST localhost
ENV EXPORT_PATH /var/export/db

COPY ./export_db.sh /usr/local/bin/export_db.sh
RUN chmod +x /usr/local/bin/export_db.sh

RUN mkdir -p ${EXPORT_PATH}

# Run the cron every minute
RUN echo '*  *  0  *  *    /usr/local/bin/export_db.sh' > /etc/crontabs/root

WORKDIR ${EXPORT_PATH}

CMD ["crond", "-f", "-d", "8"]