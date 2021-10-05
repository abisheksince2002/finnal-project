#!/bin/bash
whiptail --title "Scanned IP Adress" --yesno "$(cat .ipaddr4.txt |grep "Nmap scan report" |cut -d " " -f5)" 20 30
bash setup.sh
