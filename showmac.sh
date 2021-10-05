#!/bin/bash
whiptail --title "SHOW SCANNED MAC" --yesno "$(cat .ipaddr4.txt | grep "MAC"|  cut -d " " -f3)" 20 30 
bash setup.sh
