#!/bin/bash
# ------------------------------------
# Script designed to select taxi trips taken within a
# certain area of prominent investment banks
#INPUT FILE SHOULD BE TRIP DATA FILE,
#OUTPUT: 'ride.csv'

echo "Running" $0 "on" $1

echo enter data filename:
read INPUT_FILE
echo enter month:
read MONTH
echo enter year:
read YEAR
DASH="-"
RIDES="rides"
FILENAME=$RIDES$MONTH$DASH$YEAR

cat $INPUT_FILE | \
python -c 'import taxi; taxi.extract_rides()' > temp.csv

cat temp.csv | \
(head -n 1 temp.csv && tail -n +2 temp.csv | sort -t "," -k1 -k2) > $FILENAME.csv
