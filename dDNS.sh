#!/bin/bash
while true
do

# Read this script carefully, you MUST insert your username/passwords/hostnames into this script. 
# This script is insecure as your information is used to update your DNS records using plain text using the http protocol.
# Use at your own risk

IP=`wget -O - -q icanhazip.com`

echo -e "dDNS Script - By DejaVu"
echo -e "github.com/DejaVu/MdDNS"
echo -e "\e[00;30m============================\e[00m"
echo -e "Current IP is \e[00;34m$IP\e[00m"
echo -e "\e[00;30m============================\e[00m"

# Sitelutions Configuration (http://www.sitelutions.com)
# Sitelutions is a Free Dynamic service for top level domains - Nameservers must point to them

	# Sitelutions Username/email	
		U=

	# Sitelutions Password
		P=

	# Sitelutions RecordID's seperated with commas
		R=

	# Sitelustions Registered .com
		H=
 
			ping -c 1 -w 4 $H > /dev/null
			  if [ $? -eq 0 ]; then 
				echo -e "Ping Sitelutions Domain \e[00;32mOK\e[00m"
				echo "Update not required"
				echo -e "IP Already \e[00;32m$IP\e[00m"
				echo -e "\e[00;30m============================\e[00m"
			else
				echo -e "Ping Siteultions Domain \e[00;31mFailed\e[00m"
				echo "Updating IP Address"
				echo -e "to \e[00;31m$IP\e[00m"
					REQUEST="https://www.sitelutions.com/dnsup?user=$U&pass=$P&id=$R&ip=$IP"
					OUTPUT=`wget -O - -q $REQUEST`
				echo -e "\e[00;30m============================\e[00m"
			  fi

# dnsEXIT Configuration (http://www.dnsexit.com)
# dnsEXIT is a Free Dynamic service for top level domains - Nameservers must point to them 

# 	dnsEXIT Username
		U=

# 	dnsEXIT Password
		P=

# 	dnsEXIT Hostname / .com
		H=

			ping -c 1 -w 4 $H > /dev/null
			  if [ $? -eq 0 ]; then 
			    echo -e "Ping dynEXIT Domain \e[00;32mOK\e[00m"
			    echo "Update not required"
				echo -e "IP Already \e[00;32m$IP\e[00m"
				echo -e "\e[00;30m============================\e[00m"
			else
				echo -e "Ping dynEXIT Domain \e[00;31mFailed\e[00m"
				echo "Updating IP Address"
				echo -e "to \e[00;31m$IP\e[00m"
					REQUEST="http://www.dnsexit.com/RemoteUpdate.sv?login=$U&password=$P&host=$H"
					OUTPUT=`wget -O - -q $REQUEST`
				echo -e "\e[00;30m============================\e[00m"
			  fi

# ChangeIP Configuration (http://www.changeip.com)
	# ChangeIP Username
		U=

	# ChangeIP Password
		P=

	# ChangeIP Hostname
		H=

			ping -c 1 -w 4 $H > /dev/null
			  if [ $? -eq 0 ]; then 
				echo -e "Ping ChangeIP Domain \e[00;32mOK\e[00m"
				echo "Update not required"
				echo -e "IP Already \e[00;32m$IP\e[00m"
				echo -e "\e[00;30m============================\e[00m"
			else
				echo -e "Ping ChangeIP Domain \e[00;31mFailed\e[00m"
				echo "Updating IP Address to"
				echo -e "to \e[00;31m$IP\e[00m"
					REQUEST="https://$U:$P@nic.ChangeIP.com/nic/update?hostname=$H&myip=$IP&backupMX="
					OUTPUT=`wget -O - -q $REQUEST`
				echo -e "\e[00;30m============================\e[00m"
			  fi

# DynDNS Configuration (http://www.dyn.com)
	# DynDNS Username
		U=

	# Dyn Password
		P=

	# Dyn Hostname
		H=

			ping -c 1 -w 4 $H > /dev/null
			  if [ $? -eq 0 ]; then 
				echo -e "Ping DynDNS Domain \e[00;32mOK\e[00m"
				echo "Update not required"
				echo -e "IP Already \e[00;32m$IP\e[00m"
				echo -e "\e[00;30m============================\e[00m"
			else
				echo -e "Ping DynDNS Domain \e[00;31mFailed\e[00m"
				echo "Updating IP Address"
				echo -e "to \e[00;31m$IP\e[00m"
					REQUEST="http://$U:$P@members.dyndns.org/nic/update?hostname=$H&myip=$IP"
					OUTPUT=`wget -O - -q $REQUEST`
				echo -e "\e[00;30m============================\e[00m"
			 fi

# ClouDNS Configuration (http://www.cloudns.net)
	# ClouDNS's Unique ID
		U=

	# CloudDNS's Host
		H=

			ping -c 1 -w 4 $H > /dev/null
			  if [ $? -eq 0 ]; then 
				echo -e "Ping ClouDNS Domain \e[00;32mOK\e[00m"
				echo "Update not required"
				echo -e "IP Already \e[00;32m$IP\e[00m"
				echo -e "\e[00;30m============================\e[00m"
			else
				echo -e "Ping ClouDNS Domain \e[00;31mFailed\e[00m"
				echo "Updating IP Address"
				echo -e "to \e[00;31m$IP\e[00m"
					REQUEST="http://ipv4.cloudns.net/api/dynamicURL/?q=$U"
					OUTPUT=`wget -O - -q $REQUEST`
				echo -e "\e[00;30m============================\e[00m"
			  fi

# NOIP Configuration (http://www.noip.com)
# NOIP needs to be checked before updating to prevent abuse or hammering the update server, ping will not work as NOIP uses 'holding pages'.

	# NOIP Username
		U=

	# NOIP Password	
		P=

	# NOIP Hostname
		H=

		STOREDIPFILE=/tmp/tmpIP
	  if [ ! -e $STOREDIPFILE ]; then 
		touch $STOREDIPFILE
	  fi
		NEWIP=$IP
		STOREDIP=$(cat $STOREDIPFILE)

	  if [ "$NEWIP" != "$STOREDIP" ]; then
			RESULT=$(wget -O "$LOGFILE" -q --no-check-certificate "https://$U:$P@dynupdate.no-ip.com/nic/update?hostname=$H&myip=$NEWIP")
			echo $NEWIP > $STOREDIPFILE
			echo -e "Ping NOIP Domain \e[00;31mFailed\e[00m"
			echo "Updating IP Address"
			echo -e "to \e[00;31m$IP\e[00m"
			echo -e "\e[00;30m============================\e[00m"
		else
			echo -e "Ping NOIP Domain \e[00;32mOK\e[00m"
			echo "Update not required"
			echo -e "IP Already \e[00;32m$IP\e[00m"
		  fi

sleep 1800
clear
done
