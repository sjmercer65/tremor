/*
Creates and populates a table with accelerometer features generated
by the six feature callers

NOTE: Drop the final column (error) because it is usually absent,
and absence makes imports error

Use python script process_tsv.py to remove the error field and rename
fields to remove illegal characters prior to Postgres load

Example usage:
python /tremor/src/python/process_tsv.py TremorLapLeftFeatures.tsv o > output_tsv.tsv

NOTE: edit the final line of this file to use the correct file path on you system
*/

DROP TABLE acc_1;

CREATE TABLE acc_1
(
   deviceMotion_tremor_handInLap_right_json_items varchar(200),
   recordId varchar(200),
   appVersion varchar(200),
   phoneInfo varchar(200),
   uploadDate date,
   healthCode varchar(200),
   externalId varchar(200),
   dataGroups varchar(200),
   createdOn timestamp,
   createdOnTimeZone varchar(200),
   userSharingScope varchar(200),
   accel_tremor_handInLap_right_json_items varchar(200),
   accel_tremor_handInLap_left_json_items varchar(200),
   deviceMotion_tremor_handInLap_left_json_items varchar(200),
   accel_tremor_handAtShoulderLength_right_json_items varchar(200),
   deviceMotion_tremor_handAtShoulderLength_right_json_items varchar(200),
   accel_tremor_handAtShoulderLength_left_json_items varchar(200),
   deviceMotion_tremor_handAtShoulderLength_left_json_items varchar(200),
   accel_tremor_handToNose_right_json_items varchar(200),
   deviceMotion_tremor_handToNose_right_json_items varchar(200),
   accel_tremor_handToNose_left_json_items varchar(200),
   deviceMotion_tremor_handToNose_left_json_items varchar(200),
   momentInDayFormat_json_choiceAnswers varchar(200),
   medicationActivityTiming_json_choiceAnswers varchar(200),
   skipHand_json_answer varchar(200),
   idx varchar(200),
   lap_right_file varchar(200),
   medicationTime varchar(200),
   momentInDay varchar(200),
   meanX double precision,
   sdX double precision,
   modeX double precision,
   skewX double precision,
   kurX double precision,
   q1X double precision,
   medianX double precision,
   q3X double precision,
   iqrX double precision,
   rangeX double precision,
   acfX double precision,
   zcrX double precision,
   dfaX double precision,
   cvX double precision,
   tkeoX double precision,
   F0X double precision,
   P0X double precision,
   F0FX double precision,
   P0FX double precision,
   medianF0FX double precision,
   sdF0FX double precision,
   tlagX double precision,
   meanY double precision,
   sdY double precision,
   modeY double precision,
   skewY double precision,
   kurY double precision,
   q1Y double precision,
   medianY double precision,
   q3Y double precision,
   iqrY double precision,
   rangeY double precision,
   acfY double precision,
   zcrY double precision,
   dfaY double precision,
   cvY double precision,
   tkeoY double precision,
   F0Y double precision,
   P0Y double precision,
   F0FY double precision,
   P0FY double precision,
   medianF0FY double precision,
   sdF0FY double precision,
   tlagY double precision,
   meanZ double precision,
   sdZ double precision,
   modeZ double precision,
   skewZ double precision,
   kurZ double precision,
   q1Z double precision,
   medianZ double precision,
   q3Z double precision,
   iqrZ double precision,
   rangeZ double precision,
   acfZ double precision,
   zcrZ double precision,
   dfaZ double precision,
   cvZ double precision,
   tkeoZ double precision,
   F0Z double precision,
   P0Z double precision,
   F0FZ double precision,
   P0FZ double precision,
   medianF0FZ double precision,
   sdF0FZ double precision,
   tlagZ double precision,
   meanAA double precision,
   sdAA double precision,
   modeAA double precision,
   skewAA double precision,
   kurAA double precision,
   q1AA double precision,
   medianAA double precision,
   q3AA double precision,
   iqrAA double precision,
   rangeAA double precision,
   acfAA double precision,
   zcrAA double precision,
   dfaAA double precision,
   cvAA double precision,
   tkeoAA double precision,
   F0AA double precision,
   P0AA double precision,
   F0FAA double precision,
   P0FAA double precision,
   medianF0FAA double precision,
   sdF0FAA double precision,
   tlagAA double precision,
   meanAJ double precision,
   sdAJ double precision,
   modeAJ double precision,
   skewAJ double precision,
   kurAJ double precision,
   q1AJ double precision,
   medianAJ double precision,
   q3AJ double precision,
   iqrAJ double precision,
   rangeAJ double precision,
   acfAJ double precision,
   zcrAJ double precision,
   dfaAJ double precision,
   cvAJ double precision,
   tkeoAJ double precision,
   F0AJ double precision,
   P0AJ double precision,
   F0FAJ double precision,
   P0FAJ double precision,
   medianF0FAJ double precision,
   sdF0FAJ double precision,
   tlagAJ double precision,
   corXY double precision,
   corXZ double precision,
   corYZ double precision
);

-- make gesture-specific import tables
DELETE FROM ACC_1;
CREATE TABLE acc_TLL AS SELECT * FROM ACC_1;
CREATE TABLE acc_TLR AS SELECT * FROM ACC_1;
CREATE TABLE acc_TSL AS SELECT * FROM ACC_1;
CREATE TABLE acc_TSR AS SELECT * FROM ACC_1;
CREATE TABLE acc_TNL AS SELECT * FROM ACC_1;
CREATE TABLE acc_TNR AS SELECT * FROM ACC_1;
DROP TABLE ACC_1;

-- import data from processed TSV files
-- NOTE specifying HEADERS does *NOT* mean data items are ignored if
-- they are under a column not to import - the job still errors.
-- use Python script process_tsv.py to preprocess and strip the error field
COPY acc_TLL FROM '/Users/sjm/Git/DS/Week10/tdata/output_TLL.tsv' WITH (FORMAT CSV, DELIMITER E'\t', HEADER);
COPY acc_TLR FROM '/Users/sjm/Git/DS/Week10/tdata/output_TLR.tsv' WITH (FORMAT CSV, DELIMITER E'\t', HEADER);
COPY acc_TSL FROM '/Users/sjm/Git/DS/Week10/tdata/output_TSL.tsv' WITH (FORMAT CSV, DELIMITER E'\t', HEADER);
COPY acc_TSR FROM '/Users/sjm/Git/DS/Week10/tdata/output_TSR.tsv' WITH (FORMAT CSV, DELIMITER E'\t', HEADER);
COPY acc_TNL FROM '/Users/sjm/Git/DS/Week10/tdata/output_TNL.tsv' WITH (FORMAT CSV, DELIMITER E'\t', HEADER);
COPY acc_TNR FROM '/Users/sjm/Git/DS/Week10/tdata/output_TNR.tsv' WITH (FORMAT CSV, DELIMITER E'\t', HEADER);
