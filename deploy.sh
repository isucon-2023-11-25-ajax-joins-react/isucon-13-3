#!/bin/bash

# コマンドライン引数からSSHキーのパスとホスト名を取得する
REMOTE_HOST=$1

# SSHを使用してリモートマシン上でコマンドを実行する
ssh isucon@"${REMOTE_HOST}" << 'EOF'
cd ~/
# mainブランチにチェックアウトし、pullする
sudo -u root git checkout main
sudo -u root git pull
# webappサービスの再起動
sudo systemctl disable --now isupipe-ruby.service
sudo systemctl enable --now isupipe-ruby.service
sudo systemctl status isupipe-ruby.service
# mysqlサービスの再起動
sudo systemctl restart mysql.service
# nginxサービスの再起動（nginxを再起動するため、正しいサービス名を指定する）
sudo systemctl restart nginx.service
EOF
