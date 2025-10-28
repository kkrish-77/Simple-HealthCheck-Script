#!/bin/bash

# Simple Linux System Health Check Script#!/bin/bash

# Simple Linux System Health Check Script

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
