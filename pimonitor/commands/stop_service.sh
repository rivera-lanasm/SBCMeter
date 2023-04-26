#!/usr/bin/env bash

set -e

# load common functions
. "$PIMONCLI_WORKDIR/common"

# =======================
cli_help_svcstop() {
  echo "
Command: svcstop
Usage: 
  stop systemd service by name
Options:
    - temp_monitor
  
"
  exit 1
}

# =======================
svc_stop() {
    
    # variables
    local svc_script=$1
    


}

case "$1" in
  monitor_temp)
    svc_stop "monitor_temp"
    ;;
  *)
    cli_help_svcstop
    ;;
esac
