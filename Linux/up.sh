# update and upgrade script
sudo nano up.sh 
	#!/bin/bash
	sudo apt -y update
	sudo apt -y upgrade
sudo chmod +x up.sh 
./up.sh