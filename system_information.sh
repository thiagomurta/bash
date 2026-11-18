#!/bin/bash

user=$(whoami)
host=$(hostname)
kernel=$(uname -r)
uptime_info=$(uptime -p)

echo "==============================="
echo "       SYSTEM INFORMATION     "
echo "==============================="
echo "Usuário: $user"
echo "Host: $host"
echo "Kernel: $kernel"
echo "Uptime: $uptime_info"
echo

echo "--- Disco ---"
df -h /
echo
echo "--- Memória ---"
free -h
