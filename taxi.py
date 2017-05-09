import csv
import dateutil
import dateutil.parser
import sys
import re
import collections
import numpy as np
import matplotlib as mat
mat.use('Agg')
import matplotlib.pyplot as plt



square_coords = {}
exact_coords = []





firm_rides = {} #dictionary of rides for each firm

def parse_locations():
    """extracts data from firm_locations.csv, stores in dicts"""

    with open('firm_locations.csv', 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            square_coords[row['\xef\xbb\xbfname']] = (float(row['square_S_lat']), float(row['square_N_lat']),
                                                      float(row['square_W_lon']), float(row['square_E_lon']))
            sw_lat = float(row['SW_lat'])
            sw_lon = float(row['SW_lon'])
            sw = (sw_lon, sw_lat)
            nw_lat = float(row['NW_lat'])
            nw_lon = float(row['NW_lon'])
            nw = (nw_lon, nw_lat)
            ne_lat = float(row['NE_lat'])
            ne_lon = float(row['NE_lon'])
            ne = (ne_lon, ne_lat)
            se_lat = float(row['SE_lat'])
            se_lon = float(row['SE_lon'])
            se = (se_lon, se_lat)
            p = mat.path.Path([sw, nw, ne, se])
            exact_coords.append((row['ticker'], p))


def extract_rides(year):
    """takes filtered results (by general area) and more precisely selects rides within more specific coordinates"""

    parse_locations()
    with sys.stdin as f, sys.stdout as f2:
        reader = csv.DictReader(f)
        writer = csv.DictWriter(f2, ['ticker','trip_pickup_datetime', 'start_lat', 'start_lon'])
        writer.writeheader()


        for row in reader:
            if year < 2010:
                datetime = row['Trip_Pickup_DateTime']
                lat = float(row['Start_Lat'])
                lon = float(row['Start_Lon'])
            else:
                datetime = row['pickup_datetime']
                lat = float(row['pickup_latitude'])
                lon = float(row['pickup_longitude'])
            for item in exact_coords:
                if item[1].contains_point((lon, lat)):
                    writer.writerow({'ticker': item[0], 'trip_pickup_datetime': datetime,'start_lat':lat, 'start_lon':lon})


def update_firm_financials():
    """this takes file firms_financial.csv and removes entries in amnt that aren't numbers"""
    with open('firms_financials.csv', 'r') as f, sys.stdout as f2:
        columns = ['ticker', 'quarter', 'year', 'date_assessed', 'segment', 'IB', 'item', 'amnt']
        writer = csv.DictWriter(f2, columns)
        writer.writeheader()
        reader = csv.DictReader(f)
        for row in reader:
            if any(char.isdigit() for char in row['amnt']):
                writer.writerow({'ticker': row['ticker'], 'quarter': row['quarter'], 'year': row['year'],
                                 'date_assessed': row['date_assessed'], 'segment': row['segment'], 'IB': row['IB'], 'item': row['item'],
                                 'amnt': row['amnt']})


def graph(filename, month):
    cnt = collections.Counter()
    with open(filename) as f:
        reader = csv.DictReader(f)
        for row in reader:
            time = row['trip_pickup_datetime']
            m = re.search(r'([0-9]*)-([0-9]*)-([0-9]*)[ ]([0-9]*)[:]([0-9]*)[:]([0-9]*)', time)
            cnt[m.group(4)] += 1


    cnt_list = sorted(cnt.items())

    hours = zip(*cnt_list)[0]
    rides = zip(*cnt_list)[1]


    #plt.bar(range(len(rides)), rides, alpha = 0.4)
    plt.xticks(np.arange(len(hours)), hours)

    plt.scatter(hours, rides, alpha = .7)
    plt.plot(hours, rides, alpha = .4)

    plt.xlabel('Time of Day')
    plt.ylabel('Number of Rides')
    plt.title('Rides for Time of Day in Month of ' + month + "2009")


    plt.show()
    plt.savefig('avg_month.png')


def graph_quarter_rides(ride_dict):
    cnt_list = sorted(cnt.items())

    hours = zip(*cnt_list)[0]
    rides = zip(*cnt_list)[1]

    # plt.bar(range(len(rides)), rides, alpha = 0.4)
    plt.xticks(np.arange(len(hours)), hours)

    plt.scatter(hours, rides, alpha=.7)
    plt.plot(hours, rides, alpha=.4)

    plt.xlabel('Time of Day)')
    plt.ylabel('Number of Rides')
    plt.title('Rides for Time of Day in Month of ' + month)

    plt.show()


def string_to_datetime(stringtime):
    m = re.search(r'([0-9]*)-([0-9]*)-([0-9]*)[ ]([0-9]*)[:]([0-9]*)[:]([0-9]*)', stringtime)
    return make_time(m.group(1), m.group(2), m.group(3), m.group(4) + m.group(5) + m.group(6))


def make_time(year, month, day, time):
    """Given a year, month, day, and time (hhmm format), parse and return the
    corresponding datetime object."""
    if time == '2400':  # small hack: 2400 is equivalent to 0000,
                        # but 2400 breaks parser
        time = '0000'
    time = time.zfill(4)  # pad left with zeros; e.g., '730' becomes '0730'
    return dateutil.parser.parse('{}-{}-{}-{}'.format(year, month, day, time))


def load_financials(quarter, year):
    """Loads financial data into dictionary"""

    firm_performance = {}  # dictionary: keys are tickers, values are list of tuples with following structure:
                                                    # ['(quarter #should be 1)', 'year', 'amnt')]
                                                    # should be 1 tuple per quarter
    with open('firms_financials.csv', 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            # key = row['ticker']
            if row['quarter'] == quarter and row['year'] == year and row['IB'] == 'yes':
                firm_performance[row['ticker']] = row['amnt']

            # if key in firm_performance:
            #     firm_performance.get(key).append((row['quarter'], row['year'], row['amnt']))
            # else:
            #     firm_performance[row['ticker']] = [((row['quarter'], row['year'], row['amnt']))]

    return firm_performance


def load_specific_rides(quarter, year):
    """used to create certain graphs"""
    ride_dict = {}
    q = []
    if quarter ==  1:
        q = [1, 2, 3]
    elif quarter == 2:
        q = [4, 5, 6]
    elif quarter ==  3:
        q = [7, 8, 9]
    elif quarter == 4:
        q = [10, 11, 12]
    else:
        raise ValueError("did not enter valid int for quarter")

    year =str(year)

    month1 = "ride_data/rides" + str(q[0]) + "-" + year + ".csv"
    month2 = "ride_data/rides" + str(q[1]) + "-" + year + ".csv"
    month3 = "ride_data/rides" + str(q[2]) + "-" + year + ".csv"

    months = [month1, month2, month3]


    for month in months:
        reader = csv.DictReader(open(month))
        for row in reader:
            if row['ticker'] in ride_dict:
                cnt = ride_dict.get(row['ticker'])
            else:
                cnt = collections.Counter()
                ride_dict[row['ticker']] = cnt
            time = row['trip_pickup_datetime']
            m = re.search(r'([0-9]*)-([0-9]*)-([0-9]*)[ ]([0-9]*)[:]([0-9]*)[:]([0-9]*)', time)
            cnt[int(m.group(4))] += 1
    return ride_dict


def plot_avg_time_and_amt(ride_quarter, financial_quarter, year):
    ride_dict = load_specific_rides(int(ride_quarter), str(year))
    firm_performance = load_financials(str(financial_quarter), str(year))

    x = []
    y = []

    tickers = ride_dict.keys()
    hours = [19, 20, 21, 22, 23, 0, 1, 2, 3]

    for ticker in tickers:
        cnt = ride_dict[ticker]
        sum_of_numbers = 0.0
        count = 0.0
        for i in range(9):
            hour = hours[i]
            departures_at_this_hour = cnt[hour]
            count += departures_at_this_hour
            sum_of_numbers += departures_at_this_hour * (i+1)
        mean = sum_of_numbers / count
        if ticker in firm_performance:
            amt = firm_performance[ticker]
            if amt != '\xe2\x80\x94':
                x.append(mean)
                y.append(float(amt))

    fit = np.polyfit(x,y,1)
    fit_fn = np.poly1d(fit)

    plt.plot(x,y,'yo',x,fit_fn(x), '--k')

    plt.scatter(x, y, alpha=.7)

    plt.xlabel('Average Time People Leave The Office')
    plt.ylabel("Firm's IB Revenue")
    plt.title('Quarter ' + str(ride_quarter) + ' Pickups vs Quarter ' + str(financial_quarter) + ' Profits, ' + str(year))

    plt.show()
    plt.savefig('firms' + financial_quarter +year+'.png')




def main():
    #ride_dict = load_specific_rides(1, '2009')
    #firm_performance = load_financials('2', '2009')
    plot_avg_time_and_amt(1, 2, 2009)
    plot_avg_time_and_amt(1, 3, 2009)
    plot_avg_time_and_amt(1, 4, 2009)


    #graph('ride_data/rides1-2009.csv', 'January')

    #graph('test_rides.csv', 'test_data')
    #graph('rides.csv', 'January')
    #graph('rides2.csv', 'February')
