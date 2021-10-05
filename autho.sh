#!/bin/bash
ipaddr4=$(whiptail --title "Enter a ip address you need to scan" --inputbox "Enter the specific ip example:192.168.1.1" 10 60 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; 
then
    echo "Entered ipadress is "$ipaddr4
		echo $ipaddr4 > .autho.txt
	{
    		for ((i = 0 ; i <= 100 ; i+=20)); do
        	sleep 1
       		 echo $i
    		done
	} | whiptail --gauge "Please wait IPadress is Adding in Authorise Section......." 6 70 0
    		bash setup.sh
else
    echo "You chose Cancel."
fi




