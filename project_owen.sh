#!/bin/bash

#make plot folder if doesnt exist
if [ ! -d "plots" ]
then
    mkdir "plots"
fi


echo "ticker,lag,metric,intercept,coefficient,r2" > all_train_regression.csv

echo -e "\nRunning Regression on All Firms... "
psql final_project -f regressions.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv

echo -e "Running Regression on BAC - No 2009... "
psql final_project -f BAC_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on BCS - No 2009... "
psql final_project -f BCS_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on BMO - No 2009... "
psql final_project -f BMO_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on C - No 2009... "
psql final_project -f C_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on COWN - No 2009... "
psql final_project -f COWN_Banking_No_2009.sql | python -c 'import regression; regression.main()'>> all_train_regression.csv


echo -e "Running Regression on CS - No 2009... "
psql final_project -f CS_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on DB - No 2009... "
psql final_project -f DB_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on EVR - No 2009... "
psql final_project -f EVR_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on GHL - No 2009... "
psql final_project -f GHL_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on GS - No 2009... "
psql final_project -f GS_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on JPM - No 2009... "
psql final_project -f JPM_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on LAZ - No 2009... "
psql final_project -f LAZ_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on MS - No 2009... "
psql final_project -f MS_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on NMR - No 2009... "
psql final_project -f NMR_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on OPY - No 2009... "
psql final_project -f OPY_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on RY - No 2009... "
psql final_project -f RY_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on SF - No 2009... "
psql final_project -f SF_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Running Regression on UBS - No 2009... "
psql final_project -f UBS_Banking_No_2009.sql | python -c 'import regression; regression.main()' >> all_train_regression.csv


echo -e "Done!\n"

