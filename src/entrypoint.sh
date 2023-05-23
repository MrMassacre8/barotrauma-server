#!/usr/bin/env bash

mkdir -p /home/container/logs/

echo "#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#"
echo "Updating barotrauma"
echo "#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#"

cp /home/container/Data/clientpermissions.xml /home/container/Data/clientpermissions_backup.xml

steamcmd \
    +force_install_dir /home/container \
    +login anonymous \
    +quit

cp /home/container/Data/clientpermissions_backup.xml /home/container/Data/clientpermissions.xml

echo "#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#"
echo "Starting barotrauma"
echo "#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#"

dos2unix "/home/container/DedicatedServer.exe"
bash "/home/container/DedicatedServer.exe" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g" | tee -a "/home/container/logs/$(date +%s).log"
