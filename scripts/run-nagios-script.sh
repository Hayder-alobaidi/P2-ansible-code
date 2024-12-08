#!/bin/bash

# Use sudo to switch to ansible-user and run the SSH command, redirecting errors to /dev/null
sudo -u ansible-user ssh -t -o StrictHostKeyChecking=no ansible-user@10.0.1.4 "export TERM=xterm && /tmp/manage-nagios-servers.sh" 2>/dev/null


# NOTEs:
# put this for the server URL for the script to work 

# Script name:
# Manage-Nagios-hosts

# Script path:
# /opt/ansible/scripts/run-nagios-script.sh

# give permission 
# chmod +x /opt/ansible/scripts/run-nagios-script.sh


# Need to change IP to nagios server , will fix later with ansible 