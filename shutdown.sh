#!/bin/bash

# 关闭clash服务
PIDS=$(pgrep -f "clash-linux-")
if [ -n "$PIDS" ]; then
	kill $PIDS
	for i in {1..5}; do
		sleep 1
		if ! pgrep -f "clash-linux-" >/dev/null; then
			break
		fi
	done
	if pgrep -f "clash-linux-" >/dev/null; then
		kill -9 $PIDS
	fi
fi

# 清除环境变量
> /etc/profile.d/clash-for-linux.sh

echo -e "\n服务关闭成功，请执行以下命令关闭系统代理：proxy_off\n"
