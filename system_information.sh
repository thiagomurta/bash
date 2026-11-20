#!/bin/bash

user=$(whoami)
host=$(hostname)
kernel=$(uname -r)
uptime_info=$(uptime -p)

echo "================================"
echo "       SYSTEM INFORMATION       "
echo "================================"
echo "User: $user"
echo "Host: $host"
echo "Kernel: $kernel"
echo "Uptime: $uptime_info"
echo

echo "--- Disk ---"
df -h /
echo

echo "--- Disk (%) ---"
df -h / | awk 'NR==2 {print $5}'
echo

echo "--- CPU model name ---"
grep "model name" /proc/cpuinfo | head -1
echo

echo "--- Memory ---"
free -h
echo

echo "--- IP ---"
hostname -I
