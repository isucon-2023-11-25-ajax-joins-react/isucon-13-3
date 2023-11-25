#!/bin/bash

DIR="nginx_access_logs"

# スクリプトのファイルパスに移動する（どのディレクトリから実行しても冪等な結果になる。）
cd $(dirname $0)/

sudo mkdir -p $DIR
current_date_time=$(date "+%Y-%m-%d_%H-%M")
sudo mv /var/log/nginx/access.log "${DIR}/nginx_${current_date_time}.txt"
sudo rm -rf /var/log/nginx/access.log
sudo systemctl restart nginx
