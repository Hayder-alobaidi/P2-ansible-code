#!/bin/bash 
clear
# Basic info
HOSTNAME=`uname -n`
SPACE=$(df -h / | awk '{print $4}' | head -2 | tail -1 )

# System load
MEMORY1=`free -t -m | grep Total | awk '{print $3" MB";}'`
MEMORY2=`free -t -m | grep "Mem" | awk '{print $2" MB";}'`
LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`

# OS
osversion=$(cat /etc/redhat-release)
if [ -z "$osversion" ]; then osversion=$(cat /etc/os-release); fi

figlet "Script-server" | /var/lib/snapd/snap/bin/lolcat 
echo -e "===============================================
 - Hostname........: $HOSTNAME
 - OS..............: $osversion
 - / Space.........: remaining $SPACE
 - CPU.............: $LOAD1, $LOAD5, $LOAD15 (1, 5, 15 min)
 - Memory..........: $MEMORY1 / $MEMORY2
==============================================="  | /var/lib/snapd/snap/bin/lolcat

