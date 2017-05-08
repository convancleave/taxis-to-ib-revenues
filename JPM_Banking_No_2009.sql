-- JPM Banking w/out 2009

COPY (

select *
from regression_table
where ticker = 'JPM'
and year != 2009

) to STDOUT WITH CSV HEADER
;
