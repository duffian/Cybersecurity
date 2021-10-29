#lynis and chkrootkit security report
sudo nano security.sh 
	#!/bin/bash
		sudo apt -y install lynis
		sudo apt -y upgrade lynis
		echo "Lynis Audit Report:" > ~/AdminWork/securitychk.txt # overwrite every time script generates new report
		sudo lynis audit system >> ~/AdminWork/securitychk.txt
			# sudo lynis update check
			# sudo lynis audit --pentest
			# sudo lynis audit --cronjob
			# sudo lynis audit -c
			# sudo lynis audit --debug
			# sudo lynis audit --quick
		sudo apt -y install chkrootkit
		echo 'chkrootkit Report:' >> ~/AdminWork/securitychk.txt
		sudo chkrootkit >> ~/AdminWork/securitychk.txt
		cat ~/AdminWork/securitychk.txt
		# systemctl -t service --all #list all running services 
	# checks lynis and chkrootkit status and generates a security report
chmod +x securityrep.sh 
./security.sh 