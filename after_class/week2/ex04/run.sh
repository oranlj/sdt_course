#!/usr/bin/env bash

count=0

while true; do
    ((count++))

    ./example.sh > stdout.txt 2> stderr.txt

    if [[ $? -ne 0 ]]; then
        break
    fi
done

echo "程序在第 $count 次运行时失败。"
echo "===== 标准输出 ====="
cat stdout.txt
echo "===== 标准错误 ====="
cat stderr.txt
