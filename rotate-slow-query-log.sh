#!/bin/bash

DIR="slow-query_logs"

if [ ! -e $DIR ]; then
  sudo mkdir $DIR
fi

cd $(dirname $0)/

current_date_time=$(date "+%Y-%m-%d_%H-%M")
file_name="${DIR}/slow-query_${current_date_time}.txt"

sudo touch $file_name
sudo chmod 777 $file_name

sudo pt-query-digest /var/log/mysql/mysql-slow.log > $file_name
sudo rm -rf /var/log/mysql/mysql-slow.log
sudo systemctl restart mysql
