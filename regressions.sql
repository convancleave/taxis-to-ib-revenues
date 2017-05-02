-- to be run on DB: final_project
-- gets table matching financial to ride data


-- to taxi: add column for late_day and lateness value
with hours as (
                select ticker, trip_pickup_datetime, (extract(hour from trip_pickup_datetime)) as hours, id
                from taxi
                )

 ,lateness as (
                select ticker, trip_pickup_datetime, hours, id
                ,CASE WHEN hours >= 19 and hours <= 23 THEN hours - 19
                     WHEN hours >= 0 and hours <= 3 THEN hours + 5
                     ELSE 0 END as lateness
                from hours
                )

 ,day_lateness as (
                    select ticker, trip_pickup_datetime, hours, lateness, id
                    ,CASE WHEN lateness >= 0 and lateness <= 4 THEN date_trunc('day', trip_pickup_datetime)
                         WHEN lateness >= 5 and lateness <= 8 THEN date_trunc('day',(trip_pickup_datetime - interval '24 hours'))
                         ELSE  date_trunc('day', trip_pickup_datetime) END as day_lateness

                    from lateness
                    where lateness > 0
                   )

--create table for absolute lateness by quarter by firm
 ,lateness_by_firm_by_day as (-- ~3 min runtime
                                    select ticker, day_lateness, count(lateness) as late_rides, extract(year from day_lateness) as year, extract(quarter from day_lateness) as quarter, sum(lateness) as total_lateness, avg(lateness) as avg_lateness
                                    from day_lateness
                                    group by ticker, day_lateness
                                    )

 ,lateness_by_firm_by_quarter as (
                                    select ticker, year, quarter, sum(late_rides) as late_rides, sum(total_lateness) as total_lateness, avg(total_lateness) as avg_q_lateness, avg(avg_lateness) as avg_d_lateness
                                    from lateness_by_firm_by_day
                                    group by ticker, year, quarter
                                    )

-- combine tables: for each quarter, for each firm, give absolute lateness, average lateness and revenue
 ,rev_and_lateness_by_firm_by_quarter as (
                                            select lq.ticker, lq.year, lq.quarter, ff.segment, ff.item, ff.amnt, lq.late_rides, lq.total_lateness, lq.avg_q_lateness, lq.avg_d_lateness
                                            from lateness_by_firm_by_quarter lq, firms_financials ff
                                            where lq.ticker = ff.ticker and lq.year = ff.year and lq.quarter = ff.quarter
                                            and ff.ib = 'yes'
                                            )
-- ~ 4 min runtime
select ticker, year, quarter, segment, item, amnt, late_rides, total_lateness, avg_q_lateness, avg_d_lateness
from rev_and_lateness_by_firm_by_quarter
;

-- run vizualization for each firm and segment

-- run regression for each firm and segment
    --q-1
    --q
    --q+1
    --q+2
    --q+3
    --q+4



-- run regression for aggregate
    --q-1
    --q
    --q+1
    --q+2
    --q+3
    --q+4

