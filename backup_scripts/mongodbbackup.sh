#!/bin/sh 
DIR=`date +%m%d%y` 
DEST=/home/backups/database/mongo/$DIR 
mkdir $DEST 
mongodump -d admin -u duo -p DuoS123 -o $DEST 
cd $DEST;
cd ../;
tar -czf $DIR.tar.gz $DIR/
sshpass -p 'DuoS123' rsync -aruv /home/backups/database/mongo/$DIR.tar.gz root@192.168.51.251:/home/backups/database/mongodb
find /db_backups/* -type d -ctime +30  -exec rm -rf '{}' ';'
#find /db_backups/* -type -d -ctime +30 -exec rm ­rf {} \



