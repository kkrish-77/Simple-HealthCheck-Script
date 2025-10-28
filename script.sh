#!/bin/bash

# Simple Linux System Health Check Script

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
MEM=$(free | awk '/Mem/{printf("%.2f%"), $3/$2*100}')
DISK=$(df -h / | awk 'NR==2 {print $5}')

echo "CPU Usage: $CPU"
echo "Memory Usage: $MEM"
echo "Disk Usage: $DISK"

CPU_LIMIT=80
MEM_LIMIT=80
DISK_LIMIT=80

CPU_VAL=${CPU%%%*}
MEM_VAL=${MEM%%%*}
DISK_VAL=${DISK%%%*}

if (( ${CPU_VAL%.*} > CPU_LIMIT )); then
  echo "ALERT!!! High CPU usage!"
fi

if (( ${MEM_VAL%.*} > MEM_LIMIT )); then
  echo " ALERT!!! High Memory usage!"
fi

if (( DISK_VAL > DISK_LIMIT )); then
  echo " ALERT!!! Low Disk Space!"
fi