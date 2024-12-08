#!/bin/bash

# Color variables
BLUE="\033[1;34m"
GREEN="\033[1;32m"
RED="\033[1;31m"
CYAN="\033[1;36m"
PURPLE="\033[1;35m"
RESET="\033[0m"

# Display menu
echo -e "\n${BLUE}What would you like to do?${RESET}"
echo -e "${GREEN}1)${RESET} Remove a host from Nagios"
echo -e "${GREEN}2)${RESET} Restore a host to Nagios"
echo -e "${GREEN}3)${RESET} Add a new host to Nagios"
echo -n -e "\n${CYAN}Enter your choice (1, 2, or 3): ${RESET}"
read USER_CHOICE

if [ "$USER_CHOICE" == "1" ]; then
    /tmp/remove-nagios-servers.sh
elif [ "$USER_CHOICE" == "2" ]; then
    /tmp/restore-nagios-servers.sh
elif [ "$USER_CHOICE" == "3" ]; then
    /tmp/add_nagios_servers.sh
else
    echo -e "\n${RED}Invalid choice. Exiting.${RESET}"
    exit 1
fi