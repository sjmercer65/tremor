/*
Finalizing demographic data cleaning
*/

-- DROPPING FIELDS

-- STRONGLY CORRELLATED WITH LABEL
ALTER TABLE ACCEL_DEM DROP COLUMN living_alone_status;

-- IRRELEVANT OR EMPTY FIELDS
ALTER TABLE ACCEL_DEM DROP COLUMN past_participation;
ALTER TABLE ACCEL_DEM DROP COLUMN externalid;
ALTER TABLE ACCEL_DEM DROP COLUMN usersharingscope;
ALTER TABLE ACCEL_DEM DROP COLUMN last_smoked;
ALTER TABLE ACCEL_DEM DROP COLUMN last_smoked_timezone;
ALTER TABLE ACCEL_DEM DROP COLUMN createdontimezone;
ALTER TABLE ACCEL_DEM DROP COLUMN uploaddate;

-- QUESTIONABLE FIELDS - MAY ADJUST LATER
ALTER TABLE ACCEL_DEM DROP COLUMN are_caretaker;
ALTER TABLE ACCEL_DEM DROP COLUMN home_usage;
ALTER TABLE ACCEL_DEM DROP COLUMN medical_usage;
ALTER TABLE ACCEL_DEM DROP COLUMN medical_usage_yesterday;
ALTER TABLE ACCEL_DEM DROP COLUMN video_usage;

-- DELETE UNLABELED RECORDS
-- NOTE DO THIS AFTER FIXING DATAGROUP LABELS (step 2)!
-- delete any remaining records with incorect datagroup labels
delete from accel_dem where datagroups = 'test_user';
delete from accel_dem where datagroups = 'control,test_user';
delete from accel_dem where datagroups = 'parkinson,test_user';
delete from accel_dem where datagroups = '';

-- DROP ROWS WHERE MISSING DATA CANNOT BE FIXED
-- RUN AFTER INDIVIDUAL FIELD UPDATES (step 3)!
delete from accel_dem where age is null;
delete from accel_dem where education = '';
delete from accel_dem where smartphone = '';

-- CHANGE FIELD DATATYPES OR LENGTH
-- TBD


-- CREATE FINAL TABLE (DEMOGRAPHICS)
-- BY RETAINING ONLY THE MOST RECEINTLY CREATED DEMOGRAPHICS RECORD FOR EACH PATIENT

CREATE TABLE demographics AS
SELECT * FROM accel_dem WHERE ctid IN
(SELECT MAX(ctid) FROM accel_dem GROUP BY healthcode);


-- FINAL SANITY CHECK
- ALL RECORDS MUST HAVE A LABEL
- ALL RECORDS MUST HAVE ALL DATA (NO BLANK FIELDS)
- ALL RECORDS MUST BE UNIQUE

-- this is the number of records currently in the demographics table
SELECT COUNT(*) FROM demographics;

-- this is how many unique recordids there are
SELECT COUNT(DISTINCT recordid) FROM demographics;

-- this is how many unique healthcodes (patients) there are
SELECT COUNT(DISTINCT healthcode) FROM demographics;

-- by now, records with missing labels will have been deleted
SELECT COUNT(*) FROM demographics WHERE datagroups = '';

-- show how many individuals are labeled in each of the two classes
SELECT datagroups, count(*) FROM demographics GROUP BY datagroups;
