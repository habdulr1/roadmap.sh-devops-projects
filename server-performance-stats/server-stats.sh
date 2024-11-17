#!/bin/bash
# Name : Script to monitor the system performance such as CPU, Memory and disk usage #
# Version: v1 #
# Author: Haroon Abdul Rauf #
# Date: 17-11-2024 #
################################################################

echo "============================================"
echo " Total CPU Usage in %"
echo "============================================"
cpu_usage=$(top -bn1 | grep "%Cpu(s)" | awk '{print $2 + $4}')
echo "CPU Usage: $cpu_usage%"
echo

echo "============================================"
echo " Total Memory Usage in %"
echo "============================================"
total_memory=$(free -m | grep "Mem:" | awk '{print $2}')
used_memory=$(free -m | grep "Mem:" | awk '{print $3}')
free_memory=$(free -m | grep "Mem:" | awk '{print $4}')
percent_mem_usage=$(free -m | grep "Mem" | awk '{print ($3/$2)*100}')
echo "Total memory: $total_memory MB"
echo "Used memory: $used_memory MB"
echo "Free memory: $free_memory MB"
echo "Memory usage in %: $percent_mem_usage %"
echo

echo "============================================"
echo " Total Disk Usage in %"
echo "============================================"
disk_used=$(df -h --total | grep 'total' | awk '{print $3}')
disk_free=$(df -h --total | grep 'total' | awk '{print $4}')
disk_free_percent=$(df -h --total | grep 'total' | awk '{print $5}')
echo "Disk used: $disk_used"
echo "Disk available: $disk_free"
echo "Disk usage in %: $disk_free_percent"
echo

echo "============================================"
echo " Top 5 process by CPU usage"
echo "============================================"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo

echo "============================================"
echo " Top 5 process by Memory usage"
echo "============================================"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo

#Extra Goals
echo "OS Version: $(cat /etc/os-release | grep "PRETTY_NAME" | cut -d= -f2 | tr -d '"')"
echo "Uptime: $(uptime -p)"
echo "Load Average: $(uptime | awk -F'load average:' '{print $2}')"
echo "Users logged in: $(who)"
echo

echo "============================================"
echo " Server Status Collected Succesfully!"
echo "============================================"
echo
