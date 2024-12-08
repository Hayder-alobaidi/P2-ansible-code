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

# List available backups
BACKUP_LIST=($(ls ${NAGIOS_BACKUP_DIR}/*.cfg 2>/dev/null | xargs -n 1 basename | sed 's/\.cfg//'))
if [ ${#BACKUP_LIST[@]} -eq 0 ]; then
  echo -e "\n${RED}No backups found in ${NAGIOS_BACKUP_DIR}.${RESET}"
  exit 1
fi

# Display backups to user
echo -e "\n${BLUE}Available backups:${RESET}"
for i in "${!BACKUP_LIST[@]}"; do
  echo -e "${GREEN}$((i+1)): ${BACKUP_LIST[$i]}${RESET}"
done

# Prompt user for host to restore
echo -n -e "\n${CYAN}Enter the number of the host you want to restore (leave empty to skip): ${RESET}"
read BACKUP_NUM

if [ -z "$BACKUP_NUM" ] || [ "$BACKUP_NUM" -lt 1 ] || [ "$BACKUP_NUM" -gt ${#BACKUP_LIST[@]} ]; then
  echo -e "\n${RED}No backup selected or invalid selection.${RESET}"
  exit 0
fi

RESTORE_HOST=${BACKUP_LIST[$((BACKUP_NUM-1))]}

# Restore host configuration if exists
if [ -f "${NAGIOS_BACKUP_DIR}/${RESTORE_HOST}.cfg" ]; then
  sudo mv "${NAGIOS_BACKUP_DIR}/${RESTORE_HOST}.cfg" "${NAGIOS_CONFIG_DIR}/"
  echo -e "\n${GREEN}Restored ${RESTORE_HOST}.cfg to ${NAGIOS_CONFIG_DIR}.${RESET}"
  echo -e "\n${BLUE}Server has been restored.${RESET}"
  # Restart Nagios service
  sudo systemctl restart ${NAGIOS_SERVICE}
  echo -e "\n${PURPLE}Nagios service restarted.${RESET}"
else
  echo -e "\n${RED}Backup configuration file does not exist.${RESET}"
fi
