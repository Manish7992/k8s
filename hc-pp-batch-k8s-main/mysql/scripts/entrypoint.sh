#!/usr/bin/env bash
#mysqld --initialize
service mysql start
cp -R /nfs/stuff/prod32 /var/lib/mysql
echo "copy happened"
#switch user
#./scripts/database.sql
# mysql -u root -p123456
# CREATE DATABASE prod32;
# USE testdb;
# exit 

# Call extra command
eval $1