#!/bin/bash
#echo -e "Creating Regression CSV...\n"
echo -e "\nRunning Regression on All Firms... "
psql final_project -f regressions.sql | python -c 'import regression; regression.main()'

echo -e "Running Regression on BAC - No 2009... "
psql final_project -f BAC_Banking_No_2009.sql | python -c 'import regression; regression.main()'


echo -e "Running Regression on GS - No 2009... "
psql final_project -f GS_Banking_No_2009.sql | python -c 'import regression; regression.main()'


#tee > echo -e "Regression CSV Created!\n" | python -c 'import regression; regression.main()'
#cat regression_table.csv | python -c 'import regression; regression.get_data()'
#echo -e "Got Data!\n"
#cat regression_table.csv | python -c 'import regression; regression.main()'
echo -e "Done!\n"

