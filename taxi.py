import csv
import datetime
import dateutil
import dateutil.parser
import sys
import re
from matplotlib import path

from signal import signal, SIGPIPE, SIG_DFL
signal(SIGPIPE,SIG_DFL)


square_coords = {}
exact_coords = {}


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
            p = path.Path([sw, nw, ne, se])
            paths.append((key, p))

        for row in reader:
            datetime = row['Trip_Pickup_DateTime']
            lat = float(row['Start_Lat'])
            lon = float(row['Start_Lon'])
            for p in paths:
                if p[1].contains_point((lon, lat)):
                    writer.writerow({'ticker': p[0][1], 'trip_pickup_datetime': datetime,'start_lat':lat, 'start_lon':lon})

