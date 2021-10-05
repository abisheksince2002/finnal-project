#!/bin/bash

HEIGHT=20
WIDTH=60
CHOICE_HEIGHT=8
BACKTITLE="EAGLE VISION"
TITLE="CHOSE YOUR OPTION"
MENU="Choose one of the following options:"

OPTIONS=(1 "To Scan IP"
         2 "Show scaned IP"
         3 "TO scan MAC"
	 4 "Show scaned MAC"
	 5 "To make Authorised IP"
	 6 "To kick out IP from network"
	 7 "To watch UnAuthorised IP in wireshark"
	 8 "QUIT")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "You are selecting to scan IP"
		bash ipscan.sh
            ;;
        2)
            echo "Show scanned IP"
		bash showip.sh
            ;;
        3)
            echo "You are selecting to scan MAC"
		{
    		for ((i = 0 ; i <= 100 ; i+=20)); do
        		sleep 1
        		echo $i
    		done
		} | whiptail --gauge "MAC adress is scanning" 6 60 0
		bash setup.sh
            ;;
	4)
	    echo "show scanned mac"
		bash showmac.sh
		;;
	5)
		echo"To make Authorised IP"
		bash autho.sh
		;;
	6)
		echo "To kickout IP from network"
		evillimiter
		bash setup.sh
		;;
	7)
		echo "To watch UnAuthorised IP from via Wireshark"
		bash  ipscan1.sh
		;;
	8)
		exit
		;;
esac
