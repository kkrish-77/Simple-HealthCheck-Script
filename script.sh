#!/bin/bash

# Simple Linux System Health Check Script

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
MEM=$(free | awk '/Mem/{printf("%.2f%"), $3/$2*100}')
