#!/bin/bash

echo "Select a playbook to run:"
echo "1) Ansible Server Setup"
echo "2) Webservers Setup"
echo "3) Chat Server Setup"
echo "4) Nagios Server Setup"
echo "5) Log Server Setup"
echo "6) Exit"

read -p "Enter your choice [1-4]: " choice

case $choice in
    1)
        ansible-playbook /opt/ansible/playbooks/ansible_node/main_playbook.yaml
        ;;
    2)
        ansible-playbook /opt/ansible/playbooks/webservers/main_playbook.yaml
        ;;
    3)
        ansible-playbook /opt/ansible/playbooks/chat_server/main_playbook.yaml
        ;;
    4)
        ansible-playbook /opt/ansible/playbooks/ # Need fix 
        ;;
    5)
        ansible-playbook /opt/ansible/playbooks/ # Not ready yet 
        ;;
    6)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
esac
