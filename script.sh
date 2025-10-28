#!/bin/bash

# Simple Linux System Health Check Script

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
MEM=$(free | awk '/Mem/{printf("%.2f%"), $3/$2*100}')
DISK=$(df -h / | awk 'NR==2 {print $5}')

echo "CPU Usage: $CPU"
echo "Memory Usage: $MEM"
echo "Disk Usage: $DISK"