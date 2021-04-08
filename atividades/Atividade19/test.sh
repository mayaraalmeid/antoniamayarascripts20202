#!/bin/bash
apt update
apt-get install -y mysql-server

sed -ri 's\*bind-address.*=127.0.0.1/bind-address = 0.0.0.0/0' /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl restart mysql.service
