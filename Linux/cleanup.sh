#clean tmp and cache
sudo nano cleanup.sh 
	#!/bin/bash
	sudo rm -r /tmp/*
	sudo rm -r /var/tmp/*
	sudo apt clean -y
	sudo rm -r /home/sysadmin/.cache/thumbnails
	sudo cp cleanup.sh /etc/cron.weekly
	# sudo cp cleanup.sh /etc/cron.daily
sudo chmod +x cleanup.sh