#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# Get system metrics
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
MEM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISK=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

# Log file
LOGFILE="health_alert.log"

# Check and log alerts
if (( $(echo "$CPU > $CPU_THRESHOLD" | bc -l) )); then
  echo "ALERT: High CPU usage: $CPU%" >> $LOGFILE
fi

if (( $(echo "$MEM > $MEM_THRESHOLD" | bc -l) )); then
  echo "ALERT: High Memory usage: $MEM%" >> $LOGFILE
fi

if (( $DISK > $DISK_THRESHOLD )); then
  echo "ALERT: High Disk usage: $DISK%" >> $LOGFILE
fi
