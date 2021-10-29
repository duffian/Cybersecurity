#check permissions in sensitive directories
#userid and groups report
sudo nano perms.sh 
	#!/bin/bash
		cd /
		echo 'Creating Permissions Report:'
		echo 'Permissions:' > ~/AdminWork/permissions.txt
		ls -lah /etc/shadow >> ~/AdminWork/permissions.txt
		ls -lah /etc/gshadow >> ~/AdminWork/permissions.txt
		ls -lah /etc/group >> ~/AdminWork/permissions.txt
		ls -lah /etc/passwd >> ~/AdminWork/permissions.txt
		ls -lah /home >> ~/AdminWork/permissions.txt

		echo 'userid and groups report:' > ~/AdminWork/idinfo.txt
		cat /etc/passwd >> ~/AdminWork/idinfo.txt
		groups >> ~/AdminWork/idinfo.txt
		id >> ~/AdminWork/idinfo.txt
		sudo passwd -Sa >> ~/AdminWork/idinfo.txt

		cat ~/AdminWork/permissions.txt
		cat ~/AdminWork/idinfo.txt

sudo chmod +x perms.sh 
./perms.sh