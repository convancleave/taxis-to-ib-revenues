DROP TABLE IF EXISTS taxi CASCADE;
DROP TABLE IF EXISTS firms;
DROP TABLE IF EXISTS firms_financials;

CREATE TABLE firms (
    name char(50),
    ticker char(5),
    tier int
);

CREATE TABLE firms_financials (
    ticker char(10),
    quarter int,
    year int,
    date_assessed date,
    segment char(50),
    IB char(5),
    item char(50),
    amnt numeric
);

CREATE TABLE taxi (
    --id SERIAL,
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp01_2009 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp01_2010 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp01_2011 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp01_2012 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp01_2013 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp01_2014 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp02_2009 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp02_2010 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp02_2011 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp02_2012 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp02_2013 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp02_2014 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp03_2009 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp03_2010 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp03_2011 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp03_2012 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp03_2013 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp03_2014 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp04_2009 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp04_2010 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp04_2011 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp04_2012 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp04_2013 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp04_2014 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp05_2009 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp05_2010 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp05_2011 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp05_2012 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp05_2013 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp05_2014 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp06_2009 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp06_2010 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp06_2011 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp06_2012 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp06_2013 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp06_2014 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp07_2009 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp07_2010 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp07_2011 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp07_2012 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp07_2013 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp07_2014 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp08_2009 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp08_2010 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp08_2011 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp08_2012 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp08_2013 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp08_2014 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp09_2009 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp09_2010 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp09_2011 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp09_2012 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp09_2013 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp09_2014 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp10_2009 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp10_2010 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp10_2011 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp10_2012 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp10_2013 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp10_2014 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp11_2009 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp11_2010 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp11_2011 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp11_2012 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp11_2013 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp11_2014 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp12_2009 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp12_2010 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp12_2011 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp12_2012 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp12_2013 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

CREATE TABLE temp12_2014 (
    ticker char(5),
    trip_pickup_datetime timestamp,
    start_lat numeric,
    start_lon numeric
);

COPY firms FROM '/vagrant/final-project/firms.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY firms_financials FROM '/vagrant/final-project/updated_financials.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp01_2009 FROM '/vagrant/final-project/processed_taxi_data/rides01-2009.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp01_2010 FROM '/vagrant/final-project/processed_taxi_data/rides01-2010.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp01_2011 FROM '/vagrant/final-project/processed_taxi_data/rides01-2011.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp01_2012 FROM '/vagrant/final-project/processed_taxi_data/rides01-2012.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp01_2013 FROM '/vagrant/final-project/processed_taxi_data/rides01-2013.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp01_2014 FROM '/vagrant/final-project/processed_taxi_data/rides01-2014.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp02_2009 FROM '/vagrant/final-project/processed_taxi_data/rides02-2009.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp02_2010 FROM '/vagrant/final-project/processed_taxi_data/rides02-2010.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp02_2011 FROM '/vagrant/final-project/processed_taxi_data/rides02-2011.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp02_2012 FROM '/vagrant/final-project/processed_taxi_data/rides02-2012.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp02_2013 FROM '/vagrant/final-project/processed_taxi_data/rides02-2013.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp02_2014 FROM '/vagrant/final-project/processed_taxi_data/rides02-2014.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp03_2009 FROM '/vagrant/final-project/processed_taxi_data/rides03-2009.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp03_2010 FROM '/vagrant/final-project/processed_taxi_data/rides03-2010.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp03_2011 FROM '/vagrant/final-project/processed_taxi_data/rides03-2011.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp03_2012 FROM '/vagrant/final-project/processed_taxi_data/rides03-2012.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp03_2013 FROM '/vagrant/final-project/processed_taxi_data/rides03-2013.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp03_2014 FROM '/vagrant/final-project/processed_taxi_data/rides03-2014.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp04_2009 FROM '/vagrant/final-project/processed_taxi_data/rides04-2009.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp04_2010 FROM '/vagrant/final-project/processed_taxi_data/rides04-2010.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp04_2011 FROM '/vagrant/final-project/processed_taxi_data/rides04-2011.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp04_2012 FROM '/vagrant/final-project/processed_taxi_data/rides04-2012.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp04_2013 FROM '/vagrant/final-project/processed_taxi_data/rides04-2013.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp04_2014 FROM '/vagrant/final-project/processed_taxi_data/rides04-2014.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp05_2009 FROM '/vagrant/final-project/processed_taxi_data/rides05-2009.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp05_2010 FROM '/vagrant/final-project/processed_taxi_data/rides05-2010.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp05_2011 FROM '/vagrant/final-project/processed_taxi_data/rides05-2011.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp05_2012 FROM '/vagrant/final-project/processed_taxi_data/rides05-2012.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp05_2013 FROM '/vagrant/final-project/processed_taxi_data/rides05-2013.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp05_2014 FROM '/vagrant/final-project/processed_taxi_data/rides05-2014.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp06_2009 FROM '/vagrant/final-project/processed_taxi_data/rides06-2009.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp06_2010 FROM '/vagrant/final-project/processed_taxi_data/rides06-2010.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp06_2011 FROM '/vagrant/final-project/processed_taxi_data/rides06-2011.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp06_2012 FROM '/vagrant/final-project/processed_taxi_data/rides06-2012.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp06_2013 FROM '/vagrant/final-project/processed_taxi_data/rides06-2013.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp06_2014 FROM '/vagrant/final-project/processed_taxi_data/rides06-2014.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp07_2009 FROM '/vagrant/final-project/processed_taxi_data/rides07-2009.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp07_2010 FROM '/vagrant/final-project/processed_taxi_data/rides07-2010.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp07_2011 FROM '/vagrant/final-project/processed_taxi_data/rides07-2011.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp07_2012 FROM '/vagrant/final-project/processed_taxi_data/rides07-2012.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp07_2013 FROM '/vagrant/final-project/processed_taxi_data/rides07-2013.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp07_2014 FROM '/vagrant/final-project/processed_taxi_data/rides07-2014.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp08_2009 FROM '/vagrant/final-project/processed_taxi_data/rides01-2009.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp08_2010 FROM '/vagrant/final-project/processed_taxi_data/rides08-2010.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp08_2011 FROM '/vagrant/final-project/processed_taxi_data/rides08-2011.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp08_2012 FROM '/vagrant/final-project/processed_taxi_data/rides08-2012.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp08_2013 FROM '/vagrant/final-project/processed_taxi_data/rides08-2013.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp08_2014 FROM '/vagrant/final-project/processed_taxi_data/rides08-2014.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp09_2009 FROM '/vagrant/final-project/processed_taxi_data/rides09-2009.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp09_2010 FROM '/vagrant/final-project/processed_taxi_data/rides09-2010.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp09_2011 FROM '/vagrant/final-project/processed_taxi_data/rides09-2011.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp09_2012 FROM '/vagrant/final-project/processed_taxi_data/rides09-2012.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp09_2013 FROM '/vagrant/final-project/processed_taxi_data/rides09-2013.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp09_2014 FROM '/vagrant/final-project/processed_taxi_data/rides09-2014.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp10_2009 FROM '/vagrant/final-project/processed_taxi_data/rides10-2009.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp10_2010 FROM '/vagrant/final-project/processed_taxi_data/rides10-2010.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp10_2011 FROM '/vagrant/final-project/processed_taxi_data/rides10-2011.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp10_2012 FROM '/vagrant/final-project/processed_taxi_data/rides10-2012.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp10_2013 FROM '/vagrant/final-project/processed_taxi_data/rides10-2013.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp10_2014 FROM '/vagrant/final-project/processed_taxi_data/rides10-2014.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp11_2009 FROM '/vagrant/final-project/processed_taxi_data/rides11-2009.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp11_2010 FROM '/vagrant/final-project/processed_taxi_data/rides11-2010.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp11_2011 FROM '/vagrant/final-project/processed_taxi_data/rides11-2011.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp11_2012 FROM '/vagrant/final-project/processed_taxi_data/rides11-2012.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp11_2013 FROM '/vagrant/final-project/processed_taxi_data/rides11-2013.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp11_2014 FROM '/vagrant/final-project/processed_taxi_data/rides11-2014.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp12_2009 FROM '/vagrant/final-project/processed_taxi_data/rides12-2009.csv' WITH
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp12_2010 FROM '/vagrant/final-project/processed_taxi_data/rides12-2010.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp12_2011 FROM '/vagrant/final-project/processed_taxi_data/rides12-2011.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp12_2012 FROM '/vagrant/final-project/processed_taxi_data/rides12-2012.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp12_2013 FROM '/vagrant/final-project/processed_taxi_data/rides12-2013.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');

COPY temp12_2014 FROM '/vagrant/final-project/processed_taxi_data/rides12-2014.csv' WITH 
(FORMAT csv, HEADER true, DELIMITER ',');


-- move temp tables into
INSERT INTO taxi
select *
from temp01_2009;

INSERT INTO taxi
select *
from temp01_2010;

INSERT INTO taxi
select *
from temp01_2011;

INSERT INTO taxi
select *
from temp01_2012;

INSERT INTO taxi
select *
from temp01_2013;

INSERT INTO taxi
select *
from temp01_2014;

INSERT INTO taxi
select *
from temp02_2009;

INSERT INTO taxi
select *
from temp02_2010;

INSERT INTO taxi
select *
from temp02_2011;

INSERT INTO taxi
select *
from temp02_2012;

INSERT INTO taxi
select *
from temp02_2013;

INSERT INTO taxi
select *
from temp02_2014;

INSERT INTO taxi
select *
from temp03_2009;

INSERT INTO taxi
select *
from temp03_2010;

INSERT INTO taxi
select *
from temp03_2011;

INSERT INTO taxi
select *
from temp03_2012;

INSERT INTO taxi
select *
from temp03_2013;

INSERT INTO taxi
select *
from temp03_2014;

INSERT INTO taxi
select *
from temp04_2009;

INSERT INTO taxi
select *
from temp04_2010;

INSERT INTO taxi
select *
from temp04_2011;

INSERT INTO taxi
select *
from temp04_2012;

INSERT INTO taxi
select *
from temp04_2013;

INSERT INTO taxi
select *
from temp04_2014;

INSERT INTO taxi
select *
from temp05_2009;

INSERT INTO taxi
select *
from temp05_2010;

INSERT INTO taxi
select *
from temp05_2011;

INSERT INTO taxi
select *
from temp05_2012;

INSERT INTO taxi
select *
from temp05_2013;

INSERT INTO taxi
select *
from temp05_2014;

INSERT INTO taxi
select *
from temp06_2009;

INSERT INTO taxi
select *
from temp06_2010;

INSERT INTO taxi
select *
from temp06_2011;

INSERT INTO taxi
select *
from temp06_2012;

INSERT INTO taxi
select *
from temp06_2013;

INSERT INTO taxi
select *
from temp06_2014;

INSERT INTO taxi
select *
from temp07_2009;

INSERT INTO taxi
select *
from temp07_2010;

INSERT INTO taxi
select *
from temp07_2011;

INSERT INTO taxi
select *
from temp07_2012;

INSERT INTO taxi
select *
from temp07_2013;

INSERT INTO taxi
select *
from temp07_2014;

INSERT INTO taxi
select *
from temp08_2009;

INSERT INTO taxi
select *
from temp08_2010;

INSERT INTO taxi
select *
from temp08_2011;

INSERT INTO taxi
select *
from temp08_2012;

INSERT INTO taxi
select *
from temp08_2013;

INSERT INTO taxi
select *
from temp08_2014;

INSERT INTO taxi
select *
from temp09_2009;

INSERT INTO taxi
select *
from temp09_2010;

INSERT INTO taxi
select *
from temp09_2011;

INSERT INTO taxi
select *
from temp09_2012;

INSERT INTO taxi
select *
from temp09_2013;

INSERT INTO taxi
select *
from temp09_2014;

INSERT INTO taxi
select *
from temp10_2009;

INSERT INTO taxi
select *
from temp10_2010;

INSERT INTO taxi
select *
from temp10_2011;

INSERT INTO taxi
select *
from temp10_2012;

INSERT INTO taxi
select *
from temp10_2013;

INSERT INTO taxi
select *
from temp10_2014;

INSERT INTO taxi
select *
from temp11_2009;

INSERT INTO taxi
select *
from temp11_2010;

INSERT INTO taxi
select *
from temp11_2011;

INSERT INTO taxi
select *
from temp11_2012;

INSERT INTO taxi
select *
from temp11_2013;

INSERT INTO taxi
select *
from temp11_2014;

INSERT INTO taxi
select *
from temp12_2009;

INSERT INTO taxi
select *
from temp12_2010;

INSERT INTO taxi
select *
from temp12_2011;

INSERT INTO taxi
select *
from temp12_2012;

INSERT INTO taxi
select *
from temp12_2013;

INSERT INTO taxi
select *
from temp12_2014;


-- add unique id to taxi table
-- ALTER TABLE taxi 
-- ADD PRIMARY KEY (id);

ALTER TABLE taxi ADD COLUMN id SERIAL PRIMARY KEY;


-- drop temporary tables
DROP TABLE temp01_2009;
DROP TABLE temp01_2010;
DROP TABLE temp01_2011;
DROP TABLE temp01_2012;
DROP TABLE temp01_2013;
DROP TABLE temp01_2014;
DROP TABLE temp02_2009;
DROP TABLE temp02_2010;
DROP TABLE temp02_2011;
DROP TABLE temp02_2012;
DROP TABLE temp02_2013;
DROP TABLE temp02_2014;
DROP TABLE temp03_2009;
DROP TABLE temp03_2010;
DROP TABLE temp03_2011;
DROP TABLE temp03_2012;
DROP TABLE temp03_2013;
DROP TABLE temp03_2014;
DROP TABLE temp04_2009;
DROP TABLE temp04_2010;
DROP TABLE temp04_2011;
DROP TABLE temp04_2012;
DROP TABLE temp04_2013;
DROP TABLE temp04_2014;
DROP TABLE temp05_2009;
DROP TABLE temp05_2010;
DROP TABLE temp05_2011;
DROP TABLE temp05_2012;
DROP TABLE temp05_2013;
DROP TABLE temp05_2014;
DROP TABLE temp06_2009;
DROP TABLE temp06_2010;
DROP TABLE temp06_2011;
DROP TABLE temp06_2012;
DROP TABLE temp06_2013;
DROP TABLE temp06_2014;
DROP TABLE temp07_2009;
DROP TABLE temp07_2010;
DROP TABLE temp07_2011;
DROP TABLE temp07_2012;
DROP TABLE temp07_2013;
DROP TABLE temp07_2014;
DROP TABLE temp08_2009;
DROP TABLE temp08_2010;
DROP TABLE temp08_2011;
DROP TABLE temp08_2012;
DROP TABLE temp08_2013;
DROP TABLE temp08_2014;
DROP TABLE temp09_2009;
DROP TABLE temp09_2010;
DROP TABLE temp09_2011;
DROP TABLE temp09_2012;
DROP TABLE temp09_2013;
DROP TABLE temp09_2014;
DROP TABLE temp10_2009;
DROP TABLE temp10_2010;
DROP TABLE temp10_2011;
DROP TABLE temp10_2012;
DROP TABLE temp10_2013;
DROP TABLE temp10_2014;
DROP TABLE temp11_2009;
DROP TABLE temp11_2010;
DROP TABLE temp11_2011;
DROP TABLE temp11_2012;
DROP TABLE temp11_2013;
DROP TABLE temp11_2014;
DROP TABLE temp12_2009;
DROP TABLE temp12_2010;
DROP TABLE temp12_2011;
DROP TABLE temp12_2012;
DROP TABLE temp12_2013;
DROP TABLE temp12_2014;






