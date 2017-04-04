#!/bin/bash
# ------------------------------------
# Script designed to select taxi trips taken within a
# certain area of prominent investment banks
#INPUT FILE SHOULD BE TRIP DATA FILE,
#OUTPUT: 'ride.csv'

echo "Running" $0 "on" $1

input_file=$1

cat $input_file | \
python -c 'import taxi; taxi.extract_rides()' > rides.csv
