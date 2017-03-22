/*
CLEANING ALL FIELDS OF DEMOGRAPHIC DATA
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
ALTER TABLE ACCEL_DEM DROP COLUMN enter_state;

-- ALSO DROP SOME COLS THAT WONT BE PREDICTIVE OF PARKINSON'S
-- (or which correllate too closely to a column we are selecting)
-- (or which lack data)
ALTER TABLE accel_dem DROP COLUMN education;
ALTER TABLE accel_dem DROP COLUMN employment;
ALTER TABLE accel_dem DROP COLUMN health_history;
ALTER TABLE accel_dem DROP COLUMN smoked;


-- UPDATING FIELD VALUES

-- field datagroups
-- DELETE UNLABELED RECORDS
-- NOTE DO THIS AFTER FIXING DATAGROUP LABELS (step 2)!
-- delete any remaining records with incorect datagroup labels
delete from accel_dem where datagroups = 'test_user';
delete from accel_dem where datagroups = 'control,test_user';
delete from accel_dem where datagroups = 'parkinson,test_user';
delete from accel_dem where datagroups = '';

-- binarize label and change field type
UPDATE accel_dem SET datagroups = '1' WHERE datagroups = 'parkinson';
UPDATE accel_dem SET datagroups = '0' WHERE datagroups = 'control';
ALTER TABLE accel_dem ALTER COLUMN datagroups TYPE INTEGER USING datagroups::integer;

-- field gender
update accel_dem set gender = 'Unknown' where gender = '["Prefer not to answer"]';
update accel_dem set gender = 'Female' where gender = '["Female"]';
update accel_dem set gender = 'Male' where gender = '["Male"]';
update accel_dem set gender = 'Unknown' where gender = '';

-- field race
update accel_dem set race = 'Latino/Hispanic' where race = '["Latino/Hispanic"]';
update accel_dem set race = 'Pacific Islander' where race = '["Pacific Islander"]';
update accel_dem set race = 'White or Caucasian' where race = '["White or Caucasian"]';
update accel_dem set race = 'Middle Eastern' where race = '["Middle Eastern"]';
update accel_dem set race = 'East Asian' where race = '["East Asian"]';
update accel_dem set race = 'Caribbean' where race = '["Caribbean"]';
update accel_dem set race = 'Mixed' where race = '["Mixed"]';
update accel_dem set race = 'South Asian' where race = '["South Asian"]';
update accel_dem set race = 'Native American' where race = '["Native American"]';
update accel_dem set race = 'Black or African' where race = '["Black or African"]';
update accel_dem set race = 'Unknown' where race = '';

-- field smartphone
update accel_dem set smartphone = 'Neither easy nor difficult' where smartphone = '["Neither easy nor difficult"]';
update accel_dem set smartphone = 'Very Difficult' where smartphone = '["Very Difficult"]';
update accel_dem set smartphone = 'Easy' where smartphone = '["Easy"]';
update accel_dem set smartphone = 'Difficult' where smartphone = '["Difficult"]';
update accel_dem set smartphone = 'Very easy' where smartphone = '["Very easy"]';

-- field packs_per_day
update accel_dem set packs_per_day = '3' WHERE packs_per_day = '["3"]';
update accel_dem set packs_per_day = '2' WHERE packs_per_day = '[2]';
update accel_dem set packs_per_day = '1' WHERE packs_per_day = '[1]';
update accel_dem set packs_per_day = '0' WHERE packs_per_day = '';
update accel_dem set packs_per_day = '4' WHERE packs_per_day = '[4]';
update accel_dem set packs_per_day = '3' WHERE packs_per_day = '[3]';

-- FILL IN YEARS_SMOKING =0 FOR THOSE WHO DON'T SMOKE
UPDATE accel_dem SET years_smoking = 0 WHERE years_smoking IS NULL;
