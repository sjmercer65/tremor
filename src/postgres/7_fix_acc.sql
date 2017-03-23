-- DROPPING COLUMNS

-- columns to drop
ALTER TABLE ACC_1 DROP COLUMN accel_tremor_handInLap_right_json_items;
ALTER TABLE ACC_1 DROP COLUMN deviceMotion_tremor_handInLap_right_json_items;
ALTER TABLE ACC_1 DROP COLUMN accel_tremor_handInLap_left_json_items;
ALTER TABLE ACC_1 DROP COLUMN deviceMotion_tremor_handInLap_left_json_items;
ALTER TABLE ACC_1 DROP COLUMN accel_tremor_handAtShoulderLength_right_json_items;
ALTER TABLE ACC_1 DROP COLUMN accel_tremor_handAtShoulderLength_left_json_items;
ALTER TABLE ACC_1 DROP COLUMN deviceMotion_tremor_handAtShoulderLength_left_json_items;
ALTER TABLE ACC_1 DROP COLUMN accel_tremor_handToNose_right_json_items;
ALTER TABLE ACC_1 DROP COLUMN deviceMotion_tremor_handToNose_right_json_items;
ALTER TABLE ACC_1 DROP COLUMN accel_tremor_handToNose_left_json_items;
ALTER TABLE ACC_1 DROP COLUMN deviceMotion_tremor_handToNose_left_json_items;
ALTER TABLE ACC_1 DROP COLUMN momentInDayFormat_json_choiceAnswers;
ALTER TABLE ACC_1 DROP COLUMN medicationActivityTiming_json_choiceAnswers;
ALTER TABLE ACC_1 DROP COLUMN deviceMotion_tremor_handAtShoulderLength_right_json_items;
-- only one of these will be present
ALTER TABLE ACC_1 DROP COLUMN lap_right_file;
ALTER TABLE ACC_1 DROP COLUMN lap_left_file;
ALTER TABLE ACC_1 DROP COLUMN shoulder_right_file;
ALTER TABLE ACC_1 DROP COLUMN shoulder_left_file;
ALTER TABLE ACC_1 DROP COLUMN nose_right_file;
ALTER TABLE ACC_1 DROP COLUMN nose_left_file;
--
ALTER TABLE ACC_1 DROP COLUMN past_participation;
ALTER TABLE ACC_1 DROP COLUMN uploaddate;
ALTER TABLE ACC_1 DROP COLUMN externalid;
ALTER TABLE ACC_1 DROP COLUMN usersharingscope;
ALTER TABLE ACC_1 DROP COLUMN skiphand_json_answer;
ALTER TABLE ACC_1 DROP COLUMN idx;


-- CLEANING (not much needed since data is generated)

-- there is nothing special about rangex, but successful feature
-- calling will give it a value; if it is null here the record should be deleted
DELETE FROM acc_1 WHERE rangex IS NULL;


-- DE-DUPLICATION

-- this de-duplicates *recordids* from acc_1
DELETE FROM acc_1
  WHERE ctid IN
    (SELECT MAX(ctid) FROM acc_1 WHERE recordid IN
      (SELECT recordid FROM acc_1 GROUP BY recordid HAVING COUNT(*) > 1)
    GROUP BY recordid);

-- this is the check - there should be no recordids that are duplicate
SELECT recordid, COUNT(recordid) FROM acc_1 GROUP BY recordid HAVING COUNT(recordid) > 1;


/*
this de-duplicates *healthcode* ids from acc_1
creating a duplicate-free table
*/
CREATE TABLE accel_data AS
  SELECT * FROM acc_1 where ctid in
  (SELECT MAX(CTID) mc FROM acc_1 GROUP BY healthcode);

-- this is the check (should produce the same number of rows)
SELECT COUNT(DISTINCT healthcode) FROM acc_1;
SELECT COUNT(*) FROM accel_data;

-- drop the temporary import table
DROP TABLE ACC_1;
