/* FOR ACCELEROMETER-RELATED DEMOGRAPHICS

CSV header row for demographics information from accelerometer repo
EDITED to remove illegal chars (. and -)
#
Edit csv file and replace header row with this row
otherwise, illegal chars in the column names will cause errors
#
"recordId","appVersion","phoneInfo","uploadDate","healthCode","externalId","dataGroups","createdOn","createdOnTimeZone","userSharingScope","age","gender","race","Enter_State","education","employment","living_alone_status","are_caretaker","past_participation","smartphone","home_usage","medical_usage","medical_usage_yesterday","video_usage","smoked","years_smoking","packs_per_day","last_smoked","last_smoked_timezone","health_history"
*/

--CREATE DATABASE tremor;

DROP TABLE accel_dem;

CREATE TABLE accel_dem
(
  recordId varchar(50),
  appVersion varchar(50),
  phoneInfo varchar(50),
  uploadDate varchar(50),
  healthCode varchar(50),
  externalId varchar(50),
  dataGroups varchar(50),
  createdOn bigint,
  createdOnTimeZone varchar(50),
  userSharingScope varchar(50),
  age integer,
  gender varchar(50),
  race varchar(50),
  Enter_State varchar(50),
  education varchar(50),
  employment varchar(50),
  living_alone_status varchar(50),
  are_caretaker varchar(50),
  past_participation varchar(50),
  smartphone varchar(50),
  home_usage varchar(50),
  medical_usage varchar(50),
  medical_usage_yesterday varchar(50),
  video_usage varchar(50),
  smoked varchar(50),
  years_smoking integer,
  packs_per_day varchar(50),
  last_smoked varchar(50),
  last_smoked_timezone varchar(50),
  health_history varchar(50)
);

COPY accel_dem FROM '/Users/sjm/Git/DS/Week10/tdata/data/accel_people.csv' DELIMITER ',' CSV HEADER;
