import csv
import datetime
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
exact_coords = {}


firm_performance = {} #dictionary of firm storing financial data
firm_rides = {} #dictionary of rides for each firm

def parse_locations():
    """extracts data from firm_locations.csv, stores in dicts"""

    with open('firm_locations.csv', 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            square_coords[row['\xef\xbb\xbfname']] = (float(row['square_S_lat']), float(row['square_N_lat']),
                                                      float(row['square_W_lon']), float(row['square_E_lon']))

            exact_coords[(row['\xef\xbb\xbfname'],row['ticker'])] = (float(row['SW_lat']), float(row['SW_lon']), float(row['NW_lat']),
                                                                float(row['NW_lon']), float(row['NE_lat']), float(row['NE_lon']),
                                                                float(row['SE_lat']), float(row['SE_lon']))


def extract_rides():
    """takes filtered results (by general area) and more precisely selects rides within more specific coordinates"""

    parse_locations()
    with sys.stdin as f, sys.stdout as f2:
        reader = csv.DictReader(f)
        writer = csv.DictWriter(f2, ['ticker','trip_pickup_datetime', 'start_lat', 'start_lon'])
        writer.writeheader()
        paths = []
        for key in exact_coords:
            #note: by convention latitude is written first. However, it corresponds to a y value
            #so our point coordinates here are written (lon, lat) to be equivalent to (x, y)
            sw_lat = exact_coords.get(key)[0]
            sw_lon = exact_coords.get(key)[1]
            sw = (sw_lon, sw_lat)
            nw_lat = exact_coords.get(key)[2]
            nw_lon = exact_coords.get(key)[3]
            nw = (nw_lon, nw_lat)
            ne_lat = exact_coords.get(key)[4]
            ne_lon = exact_coords.get(key)[5]
            ne = (ne_lon, ne_lat)
            se_lat = exact_coords.get(key)[6]
            se_lon = exact_coords.get(key)[7]
            se = (se_lon, se_lat)
            p = mat.path.Path([sw, nw, ne, se])
            paths.append((key, p))

        for row in reader:
            datetime = row['Trip_Pickup_DateTime']
            lat = float(row['Start_Lat'])
            lon = float(row['Start_Lon'])
            for p in paths:
                if p[1].contains_point((lon, lat)):
                    writer.writerow({'ticker': p[0][1], 'trip_pickup_datetime': datetime,'start_lat':lat, 'start_lon':lon})


def graph(filename, month):
    cnt = collections.Counter()
    with open(filename) as f:
        reader = csv.DictReader(f);
        print reader.fieldnames
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


def load_financials(filename):
    print "hello"
    with open('firm_locations.csv', 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            firm_performance[row['ticker']] = (row['quarter'], row['year'], row['amnt'])
    print firm_performance


def load_specific_rides(ticker, quarter, year):
    q = []
    if quarter ==  1:
        q = [1, 2, 3]
    if quarter == 2:
        q = [4, 5, 6]
    if quarter ==  3:
        q = [7, 8, 9]
    if quarter == 4:
        q = [10, 11, 12]
    else:
        raise ValueError("did not enter valid int for quarter")
    month1 = "rides" + q[0] + "-" + year
    month2 = "rides" + q[1] + "-" + year
    month3 = "rides" + q[2] + "-" + year

def main():
    graph('test_rides.csv', 'test_data')
    #graph('rides.csv', 'January')
    #graph('rides2.csv', 'February')
