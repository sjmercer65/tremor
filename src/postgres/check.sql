-- cleanup and final checks

-- make sure the base datasets were complete
SELECT COUNT(*) FROM acc_tll;
SELECT COUNT(*) FROM acc_tlr;
SELECT COUNT(*) FROM acc_tnl;
SELECT COUNT(*) FROM acc_tnr;
SELECT COUNT(*) FROM acc_tsl;
SELECT COUNT(*) FROM acc_tsr;

-- drop base datasets
DROP TABLE acc_tll;
DROP TABLE acc_tlr;
DROP TABLE acc_tnl;
DROP TABLE acc_tnr;
DROP TABLE acc_tsl;
DROP TABLE acc_tsr;

-- check final feature tables are complete
-- (should have about 220 records each)
SELECT COUNT(*) FROM tll_final;
SELECT COUNT(*) FROM tlr_final;
SELECT COUNT(*) FROM tnl_final;
SELECT COUNT(*) FROM tnr_final;
SELECT COUNT(*) FROM tsl_final;
SELECT COUNT(*) FROM tsr_final;
