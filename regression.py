import csv
import datetime
import dateutil
import dateutil.parser
import sys
from matplotlib import pyplot as plt
import pandas as pd
import numpy as np
from sklearn import linear_model
from sklearn.metrics import r2_score
# from sklearn.cross_validation import train_test_split
# from sklearn.datasets import load_boston


def main():
    # boston = load_boston()
    with sys.stdin as f, sys.stdout as f2:
        df = pd.read_csv(f, header=0)
        # print df

        # put the original column names in a python list
        original_headers = list(df.columns.values)
        # print original_headers
        # create a numpy array with the numeric values for input into scikit-learn
        data = df.as_matrix()
        x_headers = original_headers[6:9]
        # print x_headers

        # X = data[:, :-1]
        # Y = data[:, -1]

        # print X
        #for quarter lag
        lags = [0,1,2,3,4]
        for lag in lags:
            X = data[:, :-1]
            Y = data[:, -1]

            Y2 = Y[lag:]
            if lag == 0:
                X2 = X[:,:]
            else:
                print (lag*-1)
                X2 = X[:(lag*-1),:]
            # print X
            print lag, len(X2),len(Y2)
            print "Lag: Q +", lag
            print "--------------------------------------------"
            # for metric: total_lateness avg_q_lateness avg_d_lateness
            for header in x_headers:
                # print header, original_headers.index(header)
                # print X
                X3 = X2[:, original_headers.index(header)]#absolute lateness
                # print X
                # Y = data[:, -1]
                # return
                # print X
                #if single feature, reshape
                if isinstance( X3[0], (int ,float) ):
                    X3 = X3.reshape(len(X3),1)
                # print X
                # return
                # print X
                # print Y

                # print Y.shape

                # # Load the diabetes dataset
                # diabetes = datasets.load_diabetes()
                #
                # # Use only one feature
                # diabetes_X = diabetes.data[:, np.newaxis, 2]
                #
                # Split the data into training/testing sets
                train = -1

                X_train = X3[:train]
                X_test = X3[train:]

                # X_train.reshape(len(X_train), 1)
                # Split the targets into training/testing sets

                Y_train = Y2[:train]
                Y_test = Y2[train:]

                # Create linear regression object
                regr = linear_model.LinearRegression()

                # Train the model using the training sets
                # regr.fit(X_train.reshape(len(X_train), 1), Y_train)
                regr.fit(X_train, Y_train)

                # The coefficients
                print ""
                print header
                print "-------------------------"
                print 'Coefficients: '
                print "Intercept",":  ", regr.intercept_
                # i=0
                # for coef in regr.coef_:
                print header,":  ", regr.coef_[0]
                    # i+=1
                print "-------------------------"
                print "R -Squared: ",r2_score(Y_train, regr.predict(X_train))
                # print "R -Squared: ", r2_score([1,2,3,4,5,6], [1,2,3,5,6,7])
                # print "Residuals",":  ", r2_score(Y_train, y_pred)
                # print("Mean squared error: %.2f"
                #       % np.mean((regr.predict(X_train) - Y_train) ** 2))

                # The mean squared error
                # print("Mean squared error: %.2f"
                #       % np.mean((regr.predict(X_test) - Y_test) ** 2))
                # # Explained variance score: 1 is perfect prediction
                # print('Variance score: %.2f' % regr.score(X_test, Y_test))
                print ""
            print "--------------------------------------------"
            print "--------------------------------------------"
            print "--------------------------------------------"
    # Plot outputs
    # plt.scatter(diabetes_X_test, diabetes_y_test, color='black')
    # plt.plot(diabetes_X_test, regr.predict(diabetes_X_test), color='blue',
    #          linewidth=3)
    #
    # plt.xticks(())
    # plt.yticks(())
    #
    # plt.show()



    # print boston
    return



plt.switch_backend('agg')


#get reg csv

def get_data():
    with sys.stdin as f, sys.stdout as f2:
        # print "HEEEEERE!"
        reader = csv.DictReader(f)
        # writer = csv.DictWriter(f2, ['yolo', 'swag'])
        # writer.writeheader()
        # print reader
        # for row in reader:
        #     # skip cancelled/diverted flights
        #     print row['amnt']
            # if row['DepTime'] == 'NA' or row['ArrTime'] == 'NA':
            #     continue
            # scheduled_time = make_time(row['Year'],
            #                            row['Month'], row['DayofMonth'], row['CRSDepTime'])
            # writer.writerow({'TailNum': row['TailNum'], 'ScheduledDepTime': scheduled_time})
    return


#run reg on csv







def make_time(year, month, day, time):
    """Given a year, month, day, and time (hhmm format), parse and return the
    corresponding datetime object."""
    if time == '2400':  # small hack: 2400 is equivalent to 0000,
                        # but 2400 breaks parser
        time = '0000'
    time = time.zfill(4)  # pad left with zeros; e.g., '730' becomes '0730'
    return dateutil.parser.parse('{}-{}-{}-{}'.format(year, month, day, time))
######################################################################################################################
def example_function():
    """
    This is an example of a Python function that processes a stream of data
    from STDIN and writes a stream of data to STDOUT.

    The format of the input stream is the format of the flight data as
    specified in the lab description.  The format of the output stream is a CSV
    with columns TailNum, ScheduledDepTime.

    This function outputs the tail number and scheduled departure time in the
    desired format.
    """
    with sys.stdin as f, sys.stdout as f2:
        reader = csv.DictReader(f)
        writer = csv.DictWriter(f2, ['TailNum', 'ScheduledDepTime'])
        writer.writeheader()
        for row in reader:
            # skip cancelled/diverted flights
            if row['DepTime'] == 'NA' or row['ArrTime'] == 'NA':
                continue
            scheduled_time = make_time(row['Year'],
                row['Month'], row['DayofMonth'], row['CRSDepTime'])
            writer.writerow({'TailNum': row['TailNum'], 'ScheduledDepTime': scheduled_time})
######################################################################################################################
def flights():
    '''
    Write flights.csv from raw flight data with header: TailNum, ActualDepTime, ActualArrTime, Origin, Dest
    If times are NA, skip
    :return: None
    '''

    #open read and write files via standard I/O
    with sys.stdin as f, sys.stdout as f2:
        reader = csv.DictReader(f)
        writer = csv.DictWriter(f2, ['TailNum','ActualDepTime','ActualArrTime','Origin','Dest'])
        writer.writeheader()

        #loop through each line and write specified data into flights.csv, line by line
        for row in reader:
            # skip cancelled/diverted flights
            if row['DepTime'] == 'NA' or row['ArrTime'] == 'NA':
                continue
            #convert raw flight times to 'ActualDepTime' and 'ActualArrTime'
            dep_time = make_actual_dep_time(row['Year'], row['Month'], row['DayofMonth'], row['CRSDepTime'], row['DepDelay'])
            arr_time = make_actual_arr_time(row['Year'], row['Month'], row['DayofMonth'], row['CRSArrTime'], row['ArrDelay'],dep_time)
            #write data to flights.csv
            writer.writerow({'TailNum': row['TailNum'],'ActualDepTime': dep_time, 'ActualArrTime': arr_time, 'Origin':row['Origin'], 'Dest':row['Dest']})
    return