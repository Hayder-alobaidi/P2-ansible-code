#!/bin/bash

# Ensure Ansible's color output is enabled
export ANSIBLE_FORCE_COLOR=1

while true; do
    # Show the menu
    echo "Select a playbook to run:"
    echo "1) Ansible Server Setup"
    echo "2) Webservers Setup"
    echo "3) Chat Server Setup"
    echo "4) Nagios Server Setup"
    echo "5) Log Server Setup"
    echo "6) Exit"
    
    read -p "Enter your choice [1-6]: " choice

    case $choice in
        1)
            ansible-playbook  /opt/ansible/playbooks/ansible_node/main_playbook.yaml
            ;;
        2)
            ansible-playbook /opt/ansible/playbooks/webservers/main_playbook.yaml
            ;;
        3)
            ansible-playbook /opt/ansible/playbooks/chat_server/main_playbook.yaml
            ;;
        4)
            ansible-playbook /opt/ansible/playbooks/nagios_server/main_playbook.yaml #Need fix 
            ;;
        5)
            ansible-playbook /opt/ansible/playbooks/log_server/main_playbook.yaml  # Not ready yet
            ;;
        6)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a number between 1 and 6."
            ;;
    esac

    # Ask the user if they want to return to the menu or exit
    read -p "Would you like to go back to the menu? (y/n): " go_back
    if [[ "$go_back" != "y" && "$go_back" != "Y" ]]; then
        echo "Exiting..."
        exit 0
    fi
done



# ###

# put this for the server URL for the script to work 

# Script name:
# Server-Setup-menu-Script

# Script path:
# /opt/ansible/scripts/setup-menu-script.sh

