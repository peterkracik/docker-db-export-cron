#!/bin/bash

rm -rf ${EXPORT_PATH}/*
mysqldump -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} | gzip -c > ${EXPORT_PATH}/${MYSQL_DATABASE}-$(date +"%Y%m%d-%H%M%S").tar.gz