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
            square_coords[row['\xef\xbb\xbfname']] = (row['square_S_lat'], row['square_N_lat'], row['square_W_lon'],
                                                      row['square_E_lon'])
            exact_coords[(row['\xef\xbb\xbfname'],row['ticker'])] = (row['SW_lat'], row['SW_lon'],row['NW_lat'],
                                                                row['NW_lon'], row['NE_lat'], row['NE_lon'],
                                                                row['SE_lat'],row['SE_lon'])


def extract_rides():
    """extracts the rides that fit in our coordinates, writes to new csv file"""
    parse_locations()
    with sys.stdin as f, sys.stdout as f2:
        count = 0
        reader = csv.DictReader(f)
        writer = csv.DictWriter(f2, ['trip_pickup_datetime', 'start_lon', 'start_lat', 'bank_name'])
        writer.writeheader()
        for row in reader:
            datetime = row['Trip_Pickup_DateTime']
            lat = row['Start_Lat']
            lon = row['Start_Lon']
            for key in square_coords:
                s_lat = square_coords.get(key)[0]
                n_lat = square_coords.get(key)[1]
                w_lon = square_coords.get(key)[2]
                e_lon = square_coords.get(key)[3]

                if s_lat < lat < n_lat:
                    if e_lon < lon < w_lon:
                        count += 1
                        writer.writerow({'trip_pickup_datetime': datetime, 'start_lon': lon, 'start_lat': lat, 'bank_name': key})
        print count

def refine_results():
    """takes filtered results (by general area) and more precisely selects rides within more specific coordinates"""
    parse_locations()
    with open('yellow_tripdata_2009-01.csv', 'r') as f, sys.stdout as f2:
        count = 0
        reader = csv.DictReader(f)
        writer = csv.DictWriter(f2, ['trip_pickup_datetime', 'start_lon', 'start_lat', 'bank_name'])
        writer.writeheader()
        paths = []
        for key in exact_coords:
            sw_lat = exact_coords.get(key)[0]
            sw_lon = exact_coords.get(key)[1]
            nw_lat = exact_coords.get(key)[2]
            nw_lon = exact_coords.get(key)[3]
            ne_lat = exact_coords.get(key)[4]
            ne_lon = exact_coords.get(key)[5]
            se_lat = exact_coords.get(key)[6]
            se_lon = exact_coords.get(key)[7]
            p = path.Path((sw_lon, sw_lat), (nw_lon, nw_lat), (ne_lon, ne_lat), (se_lon, se_lat))
            paths.add(p)

        for row in reader:
            datetime = row['Trip_Pickup_DateTime']
            lat = row['Start_Lat']
            lon = row['Start_Lon']
            for p in paths:
                if p.contains_point((lon, lat)):
                    writer.writerow()
                    count+=1
        print count

