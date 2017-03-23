-- Master SQL script
-- ensure you are in the (empty) tremor Postgres database
-- run this script from psql as \i run_all.sql

-- Redirect output to a logfile
\o clean_and_load.log

-- load raw demographic data
\i 1_get_demographics.sql

-- fix labels
\i 2_fix_labels.sql

-- update field values and binarize label
\i 3_update_demo_fields.sql

-- remove duplicate rows
\i 4_deduplicate_demo.sql

-- create final table with one row per healthcode
\i 5_finalize_demo_data.sql


-- create tables for all six sets of accelerometer features
\i 6_get_acc.sql


-- loop to generate the final feature tables

CREATE TABLE ACC_1 AS SELECT * FROM acc_tll;
\i 7_fix_acc.sql
\i 8_create_final.sql
DROP TABLE ACCEL_DATA;
CREATE TABLE TLL_FINAL AS SELECT * FROM reg_data;
DROP TABLE REG_DATA;

CREATE TABLE ACC_1 AS SELECT * FROM acc_tlr;
\i 7_fix_acc.sql
\i 8_create_final.sql
DROP TABLE ACCEL_DATA;
CREATE TABLE TLR_FINAL AS SELECT * FROM reg_data;
DROP TABLE REG_DATA;

CREATE TABLE ACC_1 AS SELECT * FROM acc_tnl;
\i 7_fix_acc.sql
\i 8_create_final.sql
DROP TABLE ACCEL_DATA;
CREATE TABLE TNL_FINAL AS SELECT * FROM reg_data;
DROP TABLE REG_DATA;

CREATE TABLE ACC_1 AS SELECT * FROM acc_tnr;
\i 7_fix_acc.sql
\i 8_create_final.sql
DROP TABLE ACCEL_DATA;
CREATE TABLE TNR_FINAL AS SELECT * FROM reg_data;
DROP TABLE REG_DATA;

CREATE TABLE ACC_1 AS SELECT * FROM acc_tsl;
\i 7_fix_acc.sql
\i 8_create_final.sql
DROP TABLE ACCEL_DATA;
CREATE TABLE TSL_FINAL AS SELECT * FROM reg_data;
DROP TABLE REG_DATA;

CREATE TABLE ACC_1 AS SELECT * FROM acc_tsr;
\i 7_fix_acc.sql
\i 8_create_final.sql
DROP TABLE ACCEL_DATA;
CREATE TABLE TSR_FINAL AS SELECT * FROM reg_data;
DROP TABLE REG_DATA;

\q
