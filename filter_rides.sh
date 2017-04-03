#!/bin/bash
# ------------------------------------
# Script designed to select taxi trips taken within a
# certain area of prominent investment banks
#INPUT FILE SHOULD BE TRIP DATA FILE

echo "Running" $0

input_file=$1

cat $input_file | \
python -c 'import taxi; taxi.extract_rides()' > rides.csv

#cat rides.csv | \
#python -c 'import taxi; taxi.refine_results()' > precise_rides.csv
