#auditd check and report script
sudo nano auditd.sh 
	#!/bin/bash
		sudo apt -y install auditd
		systemctl restart auditd

		sudo auditctl -l
		sudo auditctl
		sudo aureport -au 
		sudo aureport -m
		sudo aureport
		# sudo auditctl -w /var/log/cron # set 'auditd' to watch '/var/log/cron'
chmod +x auditd.sh 
./auditd.sh