#!/bin/bash

if [ $# -ne 1 ]; then
    echo "usage: $0 csvfile" >&2
    exit 1
fi

CSV="$1"

if [ ! -f "${CSV}" ]; then
    echo "error: file ${CSV} does not exist" >&2
    exit 2
fi

# 输出5xx最多前2个path
awk -F',' 'NR>1 && $4~/^5[0-9][0-9]$/ {print $3}' "${CSV}" \
| sort \
| uniq -c \
| sort -k1,1nr -k2,2 \
| head -n 2

# 输出平均latency_ms，保留2位小数
awk -F',' 'NR>1 {sum += $5; cnt++} END {printf "%.2f\n", sum/cnt}' "${CSV}"
