#!/bin/bash
apt update
apt-get install -y mysql-server

sed -i '31c\bind-address      =0.0.0.0/0'  /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i '32c\mysqlx-bind-address      =0.0.0.0/0'  /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl restart mysql.service

# Onde estão definidos usuario e senha?
mysql<<EOF
CREATE DATABASE scripts;
CREATE USER '$usuario'@'%' IDENTIFIED BY '$senha';
EOF

