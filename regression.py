import csv
import sys
from matplotlib import pyplot as plt
import pandas as pd
import numpy as np
from sklearn import linear_model
from sklearn.metrics import r2_score
from sklearn.metrics import explained_variance_score


def main():
    '''
    Run Log regression on given dataset, output results to csv and plot
    :return: None
    '''
    plt.switch_backend('agg')

    with sys.stdin as f, sys.stdout as f2:
        df = pd.read_csv(f, header=0)
        writer = csv.DictWriter(f2, ['ticker', 'lag', 'metric','intercept','coefficient', 'r2'])
        # put the original column names in a python list
        original_headers = list(df.columns.values)

        # create a numpy array with the numeric values for input into scikit-learn
        data = df.as_matrix()
        x_headers = original_headers[6:9]
        if len(data) > 50:
            ticker = "ALL"
        else:
            ticker = data[0][0]

        #for quarter lag
        lags = [0,1,2,3,4]
        for lag in lags:
            X = data[:, :-1]
            Y = data[:, -1]

            Y2 = Y[lag:]
            if lag == 0:
                X2 = X[:,:]
            else:
                X2 = X[:(lag*-1),:]
            for header in x_headers:
                X3 = X2[:, original_headers.index(header)]#absolute lateness

                #if single feature, reshape
                if isinstance( X3[0], (int ,float) ):
                    X3 = X3.reshape(len(X3),1)

                train =-1

                X_train = X3[:train]
                Y_train = Y2[:train]

                # Create linear regression object
                regr = linear_model.LinearRegression()

                # Train the model using the training sets
                regr.fit(X_train, Y_train)

                #grt r-squared
                rtwo = r2_score(Y_train, regr.predict(X_train))

                #write results to csv
                writer.writerow({'ticker': ticker, 'lag': lag, 'metric': header,'intercept': regr.intercept_,'coefficient': regr.coef_[0],'r2': rtwo })

                # Plot outputs
                plt.plot(X_train, Y_train, "ko", X_train, regr.predict(X_train), "b", linewidth=3)
                plt.xlabel(header)
                plt.ylabel("IB Revenue in Millions USD")
                plt.suptitle(str(ticker) + "with Quarter Lag of " + str(lag) + " on " + str(header))
                plt.title("R-2: " + str(rtwo))
                plt.savefig("plots/"+"PLOT_" + str(ticker).strip() + "_" + str(lag) + "_" + str(header) + '.png')
                plt.close()

    return

################################################################################################################
def log_regression():
    '''
    Run Log regression on given dataset, output results to csv and plot
    :return: None
    '''
    plt.switch_backend('agg')
    with sys.stdin as f, sys.stdout as f2:
        df = pd.read_csv(f, header=0)
        writer = csv.DictWriter(f2, ['ticker', 'lag', 'metric','intercept','coefficient', 'r2'])
        # put the original column names in a python list
        original_headers = list(df.columns.values)

        # create a numpy array with the numeric values for input into scikit-learn
        data = df.as_matrix()
        x_headers = original_headers[6:9]
        if len(data) > 50:
            ticker = "ALL"
        else:
            ticker = data[0][0]

        #for quarter lag
        lags = [0,1,2,3,4]
        for lag in lags:
            X = data[:, :-1]
            Y = data[:, -1]

            Y2 = Y[lag:]
            if lag == 0:
                X2 = X[:,:]
            else:
                X2 = X[:(lag*-1),:]

            # for metric: total_lateness avg_q_lateness avg_d_lateness
            for header in x_headers:
                X3 = X2[:, original_headers.index(header)]#absolute lateness

                #if single feature, reshape
                if isinstance( X3[0], (int ,float) ):
                    X3 = X3.reshape(len(X3),1)

                train = -1

                X_train = X3[:train]
                Y_train = Y2[:train]

                Xplot = []
                Yplot = []
                i = 0
                for item in X_train:
                    Xplot.append([np.log(float(item))])
                    Yplot.append(np.log(float(Y_train[i])))
                    i+=1

                X_train = Xplot
                Y_train = Yplot

                # Create linear regression object
                regr = linear_model.LinearRegression()

                # Train the model using the training sets
                regr.fit(X_train, Y_train)

                #get r-squared score
                rtwo = r2_score(Y_train, regr.predict(X_train))

                #write results to csv
                writer.writerow({'ticker': ticker, 'lag': lag, 'metric': header,'intercept': regr.intercept_,'coefficient': regr.coef_[0],'r2': rtwo })

                #plot results
                plt.plot(X_train, Y_train, "ko", X_train, regr.predict(X_train), "b", linewidth=3)
                plt.xlabel(header)
                plt.ylabel("IB Revenue in Millions USD")
                plt.suptitle(str(ticker) + "with Quarter Lag of " + str(lag) + " on Log " + str(header))
                plt.title("R-2: " + str(rtwo))
                plt.savefig("plots/"+"LOG_PLOT_" + str(ticker).strip() + "_" + str(lag) + "_" + str(header) + '.png')
                plt.close()

    return

################################################################################################################
def regression_learn():
    '''
    Run ML regression on given dataset, output results to csv and plot
    :return: None
    '''
    plt.switch_backend('agg')
    with sys.stdin as f, sys.stdout as f2:
        percent_train = float(int(sys.argv[1]))
        if percent_train > 100.0 or percent_train < 0.0:
            print "Percent argument must be between 0 and 100!"
            return -1

        percent_train = percent_train/100.0

        df = pd.read_csv(f, header=0)
        writer = csv.DictWriter(f2, ['ticker', 'lag', 'metric','mean_squared_error','variance'])

        # put the original column names in a python list
        original_headers = list(df.columns.values)

        # create a numpy array with the numeric values for input into scikit-learn
        data = df.as_matrix()
        x_headers = original_headers[6:9]
        if len(data) > 50:
            ticker = "ALL"
        else:
            ticker = data[0][0]

        #for quarter lag
        lags = [0,1,2,3,4]
        for lag in lags:
            X = data[:, :-1]
            Y = data[:, -1]

            Y2 = Y[lag:]
            if lag == 0:
                X2 = X[:,:]
            else:
                X2 = X[:(lag*-1),:]

            # for metric: total_lateness avg_q_lateness avg_d_lateness
            for header in x_headers:
                X3 = X2[:, original_headers.index(header)]#absolute lateness

                #if single feature, reshape
                if isinstance( X3[0], (int ,float) ):
                    X3 = X3.reshape(len(X3),1)

                train = int(percent_train*len(X3))

                # Split the targets into training/testing sets
                X_train = X3[:train]
                X_test = X3[train:]

                Y_train = Y2[:train]
                Y_test = Y2[train:]

                # Create linear regression object
                regr = linear_model.LinearRegression()

                # Train the model using the training sets
                regr.fit(X_train, Y_train)

                mean_error = np.mean((regr.predict(X_test) - Y_test) ** 2)

                # Explained variance score: 1 is perfect prediction
                variance = explained_variance_score(Y_test,regr.predict(X_test))

                #write to csv
                writer.writerow({'ticker': ticker, 'lag': lag, 'metric': header,'mean_squared_error': mean_error ,'variance': variance })

                #plot the results
                plt.plot(X_train, Y_train, "ko", X_test, Y_test, "ro", X_train, regr.predict(X_train), "b", linewidth=3)
                plt.xlabel(header)
                plt.ylabel("IB Revenue in Millions USD")
                plt.suptitle(str(ticker) + "with Quarter Lag of " + str(lag) + " on " + str(header))
                plt.title("Variance: " + str(variance))
                plt.savefig("plots/"+"ML_PLOT_" + str(ticker).strip() + "_" + str(lag) + "_" + str(header) + '.png')
                plt.close()

    return
