#!/bin/bash

ROOT="/home/homer"

# 
mkdir "$ROOT/diagnostic_src"
mkdir "$ROOT/diagnostic_src/data"
mkdir "$ROOT/diagnostic_src/error"

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

for i in ${!SVC_NAME[@]}; do
    
    svc_name=${SVC_NAME[$i]}
    svc_script="{$PWD/system_setup/$SVC_SCRIPT[$i]}.sh"

    # svc template 
    SVC_TEMPLATE="[Unit]
    Description=${svc_name}

    [Service]
    ExecStart=${svc_script}
    Restart=always

    [Install]
    WantedBy=multi-user.target
    "
    echo SVC_TEMPLATE
    # chmod .sh script 
    #chmod +x svc_script
    
    # write service file 
    #sudo echo SVC_TEMPLATE > "/etc/systemd/system/${svc_script}.service"

    # enable svc file 
    #sudo "systemctl enable ${svc_script}.service"
    
    # start svc 
    #sudo "systemctl start ${svc_script}.service"

done

