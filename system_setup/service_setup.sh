#!/bin/bash

ROOT="/home/homer"

# 
mkdir -p "$ROOT/rbpi_monitor/data"
mkdir -p "$ROOT/rbpi_monitor/error"

# populate  
SVC_NAME=("RbpiHealth_Temp")
SVC_SCRIPT=("monitor_temp")

i=0
for svc_name in $SVC_NAME; do
    
    svc_script=${SVC_SCRIPT[$i]}
    svc_script_path="$PWD/rbpi_monitor/system_setup/$svc_script.sh"

    # svc template 
    SVC_TEMPLATE="[Unit]
    \nDescription=${svc_name}
    \n[Service]
    \nExecStart=${svc_script_path}
    \nRestart=always
    \n[Install]
    \nWantedBy=multi-user.target
    "
    # chmod .sh script 
    chmod +x $svc_script_path
    
    # write service file 
    sudo echo -e $SVC_TEMPLATE > "/etc/systemd/system/${svc_script}.service"

    # enable svc file 
    sudo "systemctl enable ${svc_script}.service"
    
    # start svc 
    sudo "systemctl start ${svc_script}.service"
    
    i=$((i+1))

done

