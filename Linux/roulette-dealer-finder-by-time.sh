sudo nano roulette-dealer-finder-by-time.sh
#!/bin/bash
# analyze employee schedule
# accepts 2 arguments: date (four digits) and time (AM or PM)
cat $1_Dealer_schedule | grep "$2" | grep "$3" | awk -F " " '{print $1, $2, $5, $6}'
# alternate awk '{print $1,$2,$5,$6}' *$1* | grep -w $2 | grep $3


# script to accept 3 arguments: time, date, game being played- ./roulette_dealer_finder_by_time_and_game.sh <date> <time> <AM/PM> <game>
# head -1 $1_Dealer_schedule 
	# cat $1_Dealer_schedule | grep "$2" | grep "$3" | awk -F " " '{print $1, $2, $3, $4, $5, $6, $7, $8}'
