/*
Removes all duplicate entries from accel_dem
Where a 'duplicate' entry is defined as:
  - duplicate recordid
  - duplicate createdon
*/

DELETE FROM accel_dem
  WHERE ctid IN
    (SELECT MAX(ctid) FROM accel_dem WHERE recordid IN
      (SELECT recordid FROM accel_dem GROUP BY recordid HAVING COUNT(*) > 1)
    GROUP BY recordid);
