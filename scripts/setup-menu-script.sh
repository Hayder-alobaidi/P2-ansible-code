#!/bin/bash

echo "Select a playbook to run:"
echo "1) Web Server Setup"
echo "2) Database Server Setup"
echo "3) Ansible Server Setup"
echo "4) Exit"

read -p "Enter your choice [1-4]: " choice

case $choice in
    1)
        ansible-playbook /usr/share/bugy/scripts/webserver-setup.yml
        ;;
    2)
        ansible-playbook /usr/share/bugy/scripts/database-server-setup.yml
        ;;
    3)
        ansible-playbook /usr/share/bugy/scripts/ansible-server-setup.yml
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
esac
