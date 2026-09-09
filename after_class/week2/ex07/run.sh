#!/usr/bin/env bash
set -u
cd "$(dirname "$0")"
: > ex07.log
echo '[1] 启动 4444 端口的 HTTP 服务' | tee -a ex07.log
python3 -m http.server 4444 > server.log 2>&1 &
server_pid=$!
echo "server_pid=$server_pid" | tee -a ex07.log
sleep 1
echo '[2] 使用 ss 定位监听进程' | tee -a ex07.log
ss -tlnp | grep ':4444' | tee -a ex07.log
echo '[3] 访问服务确认可用' | tee -a ex07.log
python3 -c "import urllib.request; print('HTTP status:', urllib.request.urlopen('http://127.0.0.1:4444').status)" | tee -a ex07.log
echo '[4] kill 进程并确认端口释放' | tee -a ex07.log
kill "$server_pid"
wait "$server_pid" 2>/dev/null || true
if ss -tln | grep -q ':4444'; then
    echo '端口仍被占用' | tee -a ex07.log
else
    echo '4444 端口已释放' | tee -a ex07.log
fi
