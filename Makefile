# Makefile

# 例) final-3のホスト名
REMOTE_HOST_3=ec2-18-177-64-27.ap-northeast-1.compute.amazonaws.com

deploy-3:
	bash ./deploy.sh $(REMOTE_HOST_3)

remote-ssh-3:
	ssh isucon@${REMOTE_HOST_3}

# リモートサーバーで実行する。
rotate-nginx:
	bash rotate-nginx-log.sh

# リモートサーバーで実行する。
rotate-mysql:
	bash rotate-slow-query-log.sh
