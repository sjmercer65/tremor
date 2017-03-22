/*
Finalizing demographic data cleaning
*/

-- DROP ROWS WHERE MISSING DATA CANNOT BE FIXED
-- RUN AFTER INDIVIDUAL FIELD UPDATES (step 3)!
DELETE FROM accel_dem WHERE age IS NULL;
DELETE FROM accel_dem WHERE smartphone = '';

-- CREATE FINAL TABLE (DEMOGRAPHICS)
-- BY RETAINING ONLY THE MOST RECEINTLY CREATED DEMOGRAPHICS RECORD FOR EACH PATIENT

CREATE TABLE demographics AS
SELECT * FROM accel_dem WHERE ctid IN
(SELECT MAX(ctid) FROM accel_dem GROUP BY healthcode);

-- FINAL SANITY CHECK
-- ALL RECORDS MUST HAVE A LABEL
-- ALL RECORDS MUST HAVE ALL DATA (NO BLANK FIELDS)
-- ALL RECORDS MUST BE UNIQUE

-- this is the number of records currently in the demographics table
SELECT COUNT(*) FROM demographics;

-- this is how many unique recordids there are
SELECT COUNT(DISTINCT recordid) FROM demographics;

-- this is how many unique healthcodes (patients) there are
SELECT COUNT(DISTINCT healthcode) FROM demographics;

-- by now, records with missing labels will have been deleted
SELECT COUNT(*) FROM demographics WHERE datagroups is null;

-- show how many individuals are labeled in each of the two classes
SELECT datagroups, count(*) FROM demographics GROUP BY datagroups;

-- remove the old table
DROP TABLE accel_dem;
