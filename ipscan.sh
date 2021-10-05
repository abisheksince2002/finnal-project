#!/bin/bash
ipaddr4=$(whiptail --title "Enter a ip address you need to scan" --inputbox "Enter the ip-range example:192.168.1.0" 10 60 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; 
then
    echo "Entered ipadress is "$ipaddr4
    nmap -sn $ipaddr4/24 > .ipaddr4.txt
	{
    		for ((i = 0 ; i <= 100 ; i+=20)); do
        	sleep 1
       		 echo $i
    		done
	} | whiptail --gauge "Please wait IPadress is scanning....." 6 80 0
    		bash setup.sh
else
    echo "You chose Cancel."
fi




