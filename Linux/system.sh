#simple script printing system resources
sudo nano system.sh 
#!/bin/bash
	sudo free -h >> ~/AdminWork/free_mem.txt
	sudo du -h >> ~/AdminWork/disk_usage.txt
	sudo lsof >> ~/AdminWork/open_list.txt
	sudo df -h >> ~/AdminWork/free_disk.txt
# sudo free -h >> ~/AdminWork/sysresource.txt
# sudo  du -h >> ~/AdminWork/sysresource.txt
# sudo lsof >> ~/AdminWork/sysresource.txt
# sudo df -h >> ~/AdminWork/sysresource.txt
	sudo cp ~/AdminWork/system.sh /etc/cron.weekly
	cat free_mem.txt
	cat disk_usage.txt
	cat open_list.txt
	cat free_disk.txt
# cat free_mem.txt >> sysstats.txt | cat disk_usage.txt >> sysstats.txt | cat open_list.txt >> sysstats.txt | cat free_disk.txt >> sysstats.txt
# less systemstats.txt
# cat free_mem.txt | cat disk_usage.txt | cat open_list.txt | cat free_disk.txt
# cat free_mem.txt | cat disk_usage.txt | cat open_list.txt | cat free_disk.txt > systemstats.txt
# less systemstats.txt
sudo chmod +x system.sh 
./system.sh 