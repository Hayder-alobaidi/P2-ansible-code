#!/bin/bash

# Ensure Ansible's color output is enabled
export ANSIBLE_FORCE_COLOR=1
export ANSIBLE_NOCOLOR=0  # Ensure color is enabled

# Color variables
BLUE="\033[1;34m"
GREEN="\033[1;32m"
RED="\033[1;31m"
CYAN="\033[1;36m"
PURPLE="\033[1;35m"
RESET="\033[0m"

# Function to display the menu
display_menu() {
    echo -e "\n${BLUE}Select a playbook to run:${RESET}"
    echo -e "${GREEN}1)${RESET} Ansible Server Setup"
    echo -e "${GREEN}2)${RESET} Webservers Setup"
    echo -e "${GREEN}3)${RESET} Chat Server Setup"
    echo -e "${GREEN}4)${RESET} Nagios Server Setup"
    echo -e "${GREEN}5)${RESET} Log Server Setup"
    echo -e "${GREEN}6)${RESET} database Server Setup"
    echo -e "${RED}7)${RESET} Exit"
    echo -n -e "\n${CYAN}Enter your choice [1-7]: ${RESET}"
}

# Function to run playbook
run_playbook() {
    playbook_path=$1
    echo -e "\n${PURPLE}Running playbook: $playbook_path${RESET}"  # Purple color
    ansible-playbook "$playbook_path"
}

# Main loop
while true; do
    display_menu  # Show the menu

    if ! read -t 60 -p "" choice; then
        echo -e "\n${RED}Timeout! No input received. Exiting...${RESET}"  # Red color
        exit 1
    fi

    case $choice in
        1)
            echo -e "\n${RED}You selected 'Ansible Server Setup'. This will configure your Ansible nodes.${RESET}"  # Red color
            run_playbook "/opt/ansible/playbooks/ansible_node/main_playbook.yaml"
            ;;
        2)
            echo -e "\n${RED}You selected 'Webservers Setup'. This will configure web servers.${RESET}"  # Red color
            run_playbook "/opt/ansible/playbooks/webservers/main_playbook.yaml"
            ;;
        3)
            echo -e "\n${RED}You selected 'Chat Server Setup'. This will set up the chat server.${RESET}"  # Red color
            run_playbook "/opt/ansible/playbooks/chat_server/main_playbook.yaml"
            ;;
        4)
            echo -e "\n${RED}You selected 'Nagios Server Setup'. This will set up Nagios monitoring.${RESET}"  # Red color
            run_playbook "/opt/ansible/playbooks/nagios_server/main_playbook.yaml"
            ;;
        5)
            echo -e "\n${RED}You selected 'Log Server Setup'. This will configure the log server.${RESET}"  # Red color
            run_playbook "/opt/ansible/playbooks/log_server/main_playbook.yaml"
            ;;
        6)
            echo -e "\n${RED}You selected 'database Server Setup'. This will configure the database server.${RESET}"  # Red color
            run_playbook "/opt/ansible/playbooks/databases_server/main_playbook.yaml"
            ;;
        7)
            echo -e "\n${RED}Exiting... Goodbye! Have a nice day!${RESET}"  # Red color
            exit 0
            ;;
        *)
            echo -e "\n${RED}Invalid choice. Please enter a number between 1 and 6.${RESET}"  # Red color
            ;;
    esac

    # Ask the user if they want to return to the menu or exit
    if ! read -t 30 -p "Would you like to go back to the menu? (y/n): " go_back; then
        echo -e "\n${RED}Timeout! No input received. Exiting...${RESET}"  # Red color
        exit 1
    fi
    if [[ "$go_back" != "y" && "$go_back" != "Y" ]]; then
        echo -e "\n${RED}Exiting... Goodbye! See you next time.${RESET}"  # Red color
        exit 0
    fi
done





# NOTEs:
# put this for the server URL for the script to work 

# Script name:
# Server-Setup-menu-Script

# Script path:
# /opt/ansible/scripts/setup-menu-script.sh

# give permission 
# chmod +x /opt/ansible/scripts/setup-menu-script.sh