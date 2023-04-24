#!/bin/bash

ROOT="/home/homer"

# 
mkdir -p "$ROOT/rbpi_monitor/data"
mkdir -p "$ROOT/rbpi_monitor/error"

# svc template 
SVC_TEMPLATE="[Unit]
Description=${svc_name}

[Service]
ExecStart=${svc_file}
Restart=always

[Install]
WantedBy=multi-user.target
"

# populate  
SVC_NAME=("RbpiHealth_Temp")
SVC_SCRIPT=("monitor_temp")

i=0
for svc_name in $SVC_NAME; do
    
    svc_script=${SVC_SCRIPT[$i]}
    svc_script_path="$PWD/rbpi_monitor/system_setup/$svc_script.sh"

    # svc template 
    SVC_TEMPLATE="[Unit]
    Description=${svc_name}

    [Service]
    ExecStart=${svc_script_path}
    Restart=always

    [Install]
    WantedBy=multi-user.target
    "
    echo $SVC_TEMPLATE
    # chmod .sh script 
    chmod +x svc_script_path
    
    # write service file 
    sudo echo $SVC_TEMPLATE > "$PWD/test.txt"
    #"/etc/systemd/system/${svc_script}.service"

    # enable svc file 
    #sudo "systemctl enable ${svc_script}.service"
    
    # start svc 
    #sudo "systemctl start ${svc_script}.service"
    
    i=$((i+1))

done

