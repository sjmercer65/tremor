/*
Cleaned data view - can create as a table or persist as a view, or use as a select
for each of the six sets of accelerometer features, join it to the demographics table
to produce an analysis-ready feature table
*/

--SELECT
create table reg_data as select
a.healthcode,a.datagroups,age,gender,race,enter_state as state,
education,employment,smoked,years_smoking,packs_per_day,health_history,
b.createdon,medicationtime,momentinday,meanx,sdx,modex,skewx,kurx,q1x,medianx,
q3x,iqrx,rangex,acfx,zcrx,dfax,cvx,tkeox,f0x,p0x,f0fx,p0fx,medianf0fx,
sdf0fx,tlagx,meany,sdy,modey,skewy,kury,q1y,mediany,q3y,iqry,rangey,acfy,
zcry,dfay,cvy,tkeoy,f0y,p0y,f0fy,p0fy,medianf0fy,sdf0fy,tlagy,meanz,sdz,modez,
skewz,kurz,q1z,medianz,q3z,iqrz,rangez,acfz,zcrz,dfaz,cvz,tkeoz,f0z,p0z,f0fz,
p0fz,medianf0fz,sdf0fz,tlagz,meanaa,sdaa,modeaa,skewaa,kuraa,q1aa,medianaa,
q3aa,iqraa,rangeaa,acfaa,zcraa,dfaaa,cvaa,tkeoaa,f0aa,p0aa,f0faa,
p0faa,medianf0faa,sdf0faa,tlagaa,meanaj,sdaj,modeaj,skewaj,kuraj,q1aj,medianaj,
q3aj,iqraj,rangeaj,acfaj,zcraj,dfaaj,cvaj,tkeoaj,f0aj,p0aj,f0faj,p0faj,
medianf0faj,sdf0faj,tlagaj,corxy,corxz,coryz
FROM
demographics a, accel_data b
WHERE
a.healthcode = b.healthcode;
