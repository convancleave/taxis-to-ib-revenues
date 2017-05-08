--create csv of regression table

COPY (select * from regression_table) to STDOUT WITH CSV HEADER
;


