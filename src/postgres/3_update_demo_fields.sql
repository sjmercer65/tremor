/*
CLEANING ALL FIELDS OF DEMOGRAPHIC DATA
*/

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

-- field enter_state
update accel_dem set enter_state = 'Louisiana' where enter_state = '["Louisiana"]';
update accel_dem set enter_state = 'Washington' where enter_state = '["Washington"]';
update accel_dem set enter_state = 'Virginia' where enter_state = '["Virginia"]';
update accel_dem set enter_state = 'Oregon' where enter_state = '["Oregon"]';
update accel_dem set enter_state = 'Hawaii' where enter_state = '["Hawaii"]';
update accel_dem set enter_state = 'Connecticut' where enter_state = '["Connecticut"]';
update accel_dem set enter_state = 'Oklahoma' where enter_state = '["Oklahoma"]';
update accel_dem set enter_state = 'Minnesota' where enter_state = '["Minnesota"]';
update accel_dem set enter_state = 'Arkansas' where enter_state = '["Arkansas"]';
update accel_dem set enter_state = 'Arizona' where enter_state = '["Arizona"]';
update accel_dem set enter_state = 'Rhode Island' where enter_state = '["Rhode Island"]';
update accel_dem set enter_state = 'New Mexico' where enter_state = '["New Mexico"]';
update accel_dem set enter_state = 'Montana' where enter_state = '["Montana"]';
update accel_dem set enter_state = 'Vermont' where enter_state = '["Vermont"]';
update accel_dem set enter_state = 'Idaho' where enter_state = '["Idaho"]';
update accel_dem set enter_state = 'Kentucky' where enter_state = '["Kentucky"]';
update accel_dem set enter_state = 'New York' where enter_state = '["New York"]';
update accel_dem set enter_state = 'New Jersey' where enter_state = '["New Jersey"]';
update accel_dem set enter_state = 'Nebraska' where enter_state = '["Nebraska"]';
update accel_dem set enter_state = 'Alabama' where enter_state = '["Alabama"]';
update accel_dem set enter_state = 'Florida' where enter_state = '["Florida"]';
update accel_dem set enter_state = 'Indiana' where enter_state = '["Indiana"]';
update accel_dem set enter_state = 'Iowa' where enter_state = '["Iowa"]';
update accel_dem set enter_state = 'Colorado' where enter_state = '["Colorado"]';
update accel_dem set enter_state = 'West Virginia' where enter_state = '["West Virginia"]';
update accel_dem set enter_state = 'Massachusetts' where enter_state = '["Massachusetts"]';
update accel_dem set enter_state = 'Maryland' where enter_state = '["Maryland"]';
update accel_dem set enter_state = 'Michigan' where enter_state = '["Michigan"]';
update accel_dem set enter_state = 'Texas' where enter_state = '["Texas"]';
update accel_dem set enter_state = 'Missouri' where enter_state = '["Missouri"]';
update accel_dem set enter_state = 'Tennessee' where enter_state = '["Tennessee"]';
update accel_dem set enter_state = 'Nevada' where enter_state = '["Nevada"]';
update accel_dem set enter_state = 'Maine' where enter_state = '["Maine"]';
update accel_dem set enter_state = 'South Carolina' where enter_state = '["South Carolina"]';
update accel_dem set enter_state = 'New Hampshire' where enter_state = '["New Hampshire"]';
update accel_dem set enter_state = 'Pennsylvania' where enter_state = '["Pennsylvania"]';
update accel_dem set enter_state = 'Wisconsin' where enter_state = '["Wisconsin"]';
update accel_dem set enter_state = 'Delaware' where enter_state = '["Delaware"]';
update accel_dem set enter_state = 'Unknown' where enter_state = '';
update accel_dem set enter_state = 'Ohio' where enter_state = '["Ohio"]';
update accel_dem set enter_state = 'North Dakota' where enter_state = '["North Dakota"]';
update accel_dem set enter_state = 'Guam' where enter_state = '["Guam"]';
update accel_dem set enter_state = 'South Dakota' where enter_state = '["South Dakota"]';
update accel_dem set enter_state = 'Illinois' where enter_state = '["Illinois"]';
update accel_dem set enter_state = 'Kansas' where enter_state = '["Kansas"]';
update accel_dem set enter_state = 'Mississippi' where enter_state = '["Mississippi"]';
update accel_dem set enter_state = 'Alaska' where enter_state = '["Alaska"]';
update accel_dem set enter_state = 'Utah' where enter_state = '["Utah"]';
update accel_dem set enter_state = 'Virgin Islands' where enter_state = '["Virgin Islands"]';
update accel_dem set enter_state = 'North Carolina' where enter_state = '["North Carolina"]';
update accel_dem set enter_state = 'California' where enter_state = '["California"]';
update accel_dem set enter_state = 'Puerto Rico' where enter_state = '["Puerto Rico"]';
update accel_dem set enter_state = 'Georgia' where enter_state = '["Georgia"]';

-- field education
update accel_dem set education = 'Master''s Degree' where education = '["Master''s Degree"]';
update accel_dem set education = 'Doctoral Degree' where education = '["Doctoral Degree"]';
update accel_dem set education = 'Some graduate school' where education = '["Some graduate school"]';
update accel_dem set education = 'Some college' where education = '["Some college"]';
update accel_dem set education = 'Some high school' where education = '["Some high school"]';
update accel_dem set education = '2-year college degree' where education = '["2-year college degree"]';
update accel_dem set education = '4-year college degree' where education = '["4-year college degree"]';
update accel_dem set education = 'High School Diploma/GED' where education = '["High School Diploma/GED"]';

-- field employment
update accel_dem set employment = 'full time' where employment = '["full time"]';
update accel_dem set employment = 'occasional' where employment = '["occasional"]';
update accel_dem set employment = 'part time' where employment = '["part time"]';
update accel_dem set employment = 'unknown' where employment = '';
update accel_dem set employment = 'no work' where employment = '["no work"]';

-- field are_caretaker
update accel_dem set are_caretaker = 'false' where are_caretaker = '[false]';
update accel_dem set are_caretaker = 'true' where are_caretaker = '["true"]';
update accel_dem set are_caretaker = 'true' where are_caretaker = '[true]';
update accel_dem set are_caretaker = 'false' where are_caretaker = '["false"]';

-- field smartphone
update accel_dem set smartphone = 'Neither easy nor difficult' where smartphone = '["Neither easy nor difficult"]';
update accel_dem set smartphone = 'Very Difficult' where smartphone = '["Very Difficult"]';
update accel_dem set smartphone = 'Easy' where smartphone = '["Easy"]';
update accel_dem set smartphone = 'Difficult' where smartphone = '["Difficult"]';
update accel_dem set smartphone = 'Very easy' where smartphone = '["Very easy"]';

-- field home_usage
-- PROBABLY DROP THIS FIELD
update accel_dem set home_usage = 'false' where home_usage = '[false]';
update accel_dem set home_usage = 'true' where home_usage = '["true"]';
update accel_dem set home_usage = 'true' where home_usage = '[true]';
update accel_dem set home_usage = 'false' where home_usage = '["false"]';

-- field medical_usage
-- DELETE BLANKS?
update accel_dem set medical_usage = 'false' WHERE medical_usage = '[false]';
update accel_dem set medical_usage = 'true' WHERE medical_usage = '["true"]';
update accel_dem set medical_usage = 'true' WHERE medical_usage = '[true]';
--update accel_dem set medical_usage = '' WHERE medical_usage = '';
update accel_dem set medical_usage = 'false' WHERE medical_usage = '["false"]';

-- field medical_usage_yesterday
-- DELETE BLANKS?
update accel_dem set medical_usage_yesterday = 'false' WHERE medical_usage_yesterday = '[false]';
update accel_dem set medical_usage_yesterday = 'true' WHERE medical_usage_yesterday = '[true]';
--update accel_dem set medical_usage_yesterday = '' WHERE medical_usage_yesterday = '';
update accel_dem set medical_usage_yesterday = 'false' WHERE medical_usage_yesterday = '["no"]';
update accel_dem set medical_usage_yesterday = 'dont-know' WHERE medical_usage_yesterday = '["dont-know"]';

-- field video_usage
-- DELETE BLANKS?
update accel_dem set video_usage = 'false' WHERE video_usage = '[false]';
--update accel_dem set video_usage = '' WHERE video_usage = '';
update accel_dem set video_usage = 'true' WHERE video_usage = '["true"]';
update accel_dem set video_usage = 'true' WHERE video_usage = '[true]';

-- field smoked
-- DELETE BLANKS?
update accel_dem set smoked = 'false' WHERE smoked = '[false]';
update accel_dem set smoked = 'true' WHERE smoked = '["true"]';
update accel_dem set smoked = 'true' WHERE smoked = '[true]';
--update accel_dem set smoked = '' WHERE smoked = '';
update accel_dem set smoked = 'false' WHERE smoked = '["false"]';

-- field packs_per_day
update accel_dem set packs_per_day = '3' WHERE packs_per_day = '["3"]';
update accel_dem set packs_per_day = '2' WHERE packs_per_day = '[2]';
update accel_dem set packs_per_day = '1' WHERE packs_per_day = '[1]';
update accel_dem set packs_per_day = '0' WHERE packs_per_day = '';
update accel_dem set packs_per_day = '4' WHERE packs_per_day = '[4]';
update accel_dem set packs_per_day = '3' WHERE packs_per_day = '[3]';
