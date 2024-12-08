#!/bin/bash

NAGIOS_CONFIG_DIR="/etc/nagios/servers"
NAGIOS_SERVICE="nagios"

# Prompt user for new host details
read -p "Enter the new host name: " NEW_HOST
read -p "Enter the new host IP address: " NEW_HOST_IP

# Create Nagios configuration for the new host
cat <<EOL > ${NAGIOS_CONFIG_DIR}/${NEW_HOST}.cfg
define host {
    use         linux-server
    host_name   ${NEW_HOST}
    alias       ${NEW_HOST}
    address     ${NEW_HOST_IP}
}

define service {
    use                     generic-service
    host_name               ${NEW_HOST}
    service_description     PING
    check_command           check_ping!100.0,20%!500.0,60%
}

define service {
    use                     generic-service
    host_name               ${NEW_HOST}
    service_description     Root Partition
    check_command           check_nrpe!check_disk!20%!10%!/
}

define service {
    use                     generic-service
    host_name               ${NEW_HOST}
    service_description     Current Users
    check_command           check_nrpe!check_users!20!50
}

define service {
    use                     generic-service
    host_name               ${NEW_HOST}
    service_description     Total Processes
    check_command           check_nrpe!check_procs!250!400!RSZDT
}

define service {
    use                     generic-service
    host_name               ${NEW_HOST}
    service_description     Current Load
    check_command           check_nrpe!check_load!5.0,4.0,3.0!10.0,6.0,4.0
}
EOL

echo "Created configuration file for ${NEW_HOST}."

# Restart Nagios service
systemctl restart ${NAGIOS_SERVICE}
echo "Nagios service restarted."
