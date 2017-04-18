DROP TABLE IF EXISTS taxi CASCADE;

CREATE TABLE taxi (
    vendor_name char(5) NOT NULL,
    Trip_Pickup_DateTime timestamp NOT NULL,
    Trip_Dropoff_DateTime timestamp NOT NULL,
    Passenger_Count integer,
    Trip_Distance decimal,
    Start_Lon decimal,
    Start_Lat decimal,
    Rate_Code integer,
    store_and_forward integer,
    End_Lon decimal NOT NULL,
    End_Lat decimal NOT NULL,
    Payment_Type character(10),
    Fare_Amt decimal NOT NULL,
    surcharge decimal,
    mta_tax decimal,
    Tip_Amt decimal NOT NULL,
    Tolls_Amt decimal,
    Total_Amt decimal
);

COPY taxi FROM '/vagrant/final-project/yellow_tripdata_2009-01.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');






