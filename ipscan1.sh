#!/bin/bash
ipadd=$(whiptail --title "Enter a ip address you need to scan in a wireshark" --inputbox "Enter the ip-address example:192.168.1.1" 10 60 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ];
then
	echo "Enter the ip adress "$ipadd
	tshark -i wlan0 -a duration:20 -w .capture1.pcap 
	{
                for ((i = 0 ; i <= 100 ; i+=20)); do
                sleep 1
                 echo $i
                done
        } | whiptail --gauge "Please wait packets was collecting...." 6 80 0
	wireshark -r .capture1.pcap
	bash setup.sh
	else
		echo "you choose cancel"
fi
