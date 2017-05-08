#!/bin/bash
# must add

#ensure has training % argument in $1
if [ -z $1 ]
then
    echo -e "Must add % training data as argument (e.g. 50 => 50% training)\n"
    exit
fi

#make plot folder if doesnt exist
if [ ! -d "plots" ]
then
    mkdir "plots"
fi


echo "ticker, lag, metric, mean_squared_error, variance" > ml_regression.csv

echo -e "\nRunning ML Regression on All Firms... "
psql final_project -f regressions.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv

echo -e "Running ML Regression on BAC - No 2009... "
psql final_project -f BAC_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on BCS - No 2009... "
psql final_project -f BCS_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on BMO - No 2009... "
psql final_project -f BMO_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on C - No 2009... "
psql final_project -f C_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on COWN - No 2009... "
psql final_project -f COWN_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on CS - No 2009... "
psql final_project -f CS_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on DB - No 2009... "
psql final_project -f DB_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on EVR - No 2009... "
psql final_project -f EVR_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on GHL - No 2009... "
psql final_project -f GHL_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv

echo -e "Running ML Regression on GS - No 2009... "
psql final_project -f GS_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on JPM - No 2009... "
psql final_project -f JPM_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on LAZ - No 2009... "
psql final_project -f LAZ_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on MS - No 2009... "
psql final_project -f MS_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on NMR - No 2009... "
psql final_project -f NMR_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on OPY - No 2009... "
psql final_project -f OPY_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on RY - No 2009... "
psql final_project -f RY_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on SF - No 2009... "
psql final_project -f SF_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv


echo -e "Running ML Regression on UBS - No 2009... "
psql final_project -f UBS_Banking_No_2009.sql | python -c 'import regression; regression.regression_learn()' $1 >> ml_regression.csv
#
echo -e "Done!\n"
