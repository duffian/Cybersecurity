sudo nano update.sh 
	#!/bin/bash
	apt update -y && apt upgrade -y && apt full-upgrade -y && apt-get autoremove && apt autoremove -y
	sudo cp update.sh /etc/cron.weekly
chmod +x update.sh