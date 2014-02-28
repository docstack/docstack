#/bin/bash

if [ ! -f /var/lib/mysql/ibdata1 ]; then
    mysql_install_db
fi
echo "Starting MySQL..."
mysqld_safe &
sleep 5s

echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'changeme' WITH GRANT OPTION; FLUSH PRIVILEGES;" | mysql
echo "UPDATE mysql.user SET Password=PASSWORD('password') WHERE User='root';FLUSH PRIVILEGES;" | mysql

echo "Restarting MySQL for Docker..."
killall mysqld_safe
sleep 5s
exec mysqld_safe