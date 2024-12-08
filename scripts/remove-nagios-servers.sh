#!/bin/bash

# Color variables
BLUE="\033[1;34m"
GREEN="\033[1;32m"
RED="\033[1;31m"
CYAN="\033[1;36m"
PURPLE="\033[1;35m"
RESET="\033[0m"

NAGIOS_CONFIG_DIR="/etc/nagios/servers"
NAGIOS_BACKUP_DIR="/etc/nagios/backup"
NAGIOS_SERVICE="nagios"

# List existing Nagios host configurations
HOST_LIST=($(ls ${NAGIOS_CONFIG_DIR}/*.cfg 2>/dev/null | xargs -n 1 basename | sed 's/\.cfg//'))
if [ ${#HOST_LIST[@]} -eq 0 ]; then
  echo -e "\n${RED}No hosts found in ${NAGIOS_CONFIG_DIR}.${RESET}"
  exit 1
fi

# Display existing hosts to user
echo -e "\n${BLUE}Existing hosts:${RESET}"
for i in "${!HOST_LIST[@]}"; do
  echo -e "${GREEN}$((i+1)): ${HOST_LIST[$i]}${RESET}"
done

# Prompt user for host to remove
echo -n -e "\n${CYAN}Enter the number of the host you want to remove (leave empty to skip): ${RESET}"
read HOST_NUM

if [ -z "$HOST_NUM" ] || [ "$HOST_NUM" -lt 1 ] || [ "$HOST_NUM" -gt ${#HOST_LIST[@]} ]; then
  echo -e "\n${RED}No host selected or invalid selection.${RESET}"
  exit 0
fi

REMOVE_HOST=${HOST_LIST[$((HOST_NUM-1))]}

# Move host configuration to backup if exists
if [ -f "${NAGIOS_CONFIG_DIR}/${REMOVE_HOST}.cfg" ]; then
  sudo mv "${NAGIOS_CONFIG_DIR}/${REMOVE_HOST}.cfg" "${NAGIOS_BACKUP_DIR}/"
  echo -e "\n${GREEN}Moved ${REMOVE_HOST}.cfg to ${NAGIOS_BACKUP_DIR}.${RESET}"
  echo -e "\n${BLUE}Server is removed now.${RESET}"

  # Restart Nagios service
  sudo systemctl restart ${NAGIOS_SERVICE}
  echo -e "\n${PURPLE}Nagios service restarted.${RESET}"
else
  echo -e "\n${RED}Host configuration file does not exist.${RESET}"
fi
