sudo nano dealer-analysis.sh
#!/bin/bash
#not sure if works
awk '{print $1,$2,$5,$6}' *$1* | grep -w $2 | grep $3