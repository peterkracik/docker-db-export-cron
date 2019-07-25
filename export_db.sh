#!/bin/bash

echo "Backup of database ${MYSQL_DATABASE} from host ${MYSQL_HOST}"

rm -f `ls ${EXPORT_PATH}/*  -t | awk 'NR>10'`

DATE=`date +%Y%m%d-%H%M%S`

mysqldump -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} | gzip -c > ${EXPORT_PATH}/${MYSQL_DATABASE}-$DATE.tar.gz

echo "exported file : ${EXPORT_PATH}/${MYSQL_DATABASE}-$DATE.tar.gz"