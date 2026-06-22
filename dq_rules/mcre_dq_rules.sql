-- =============================================================================
-- MCRE DDC - Data Quality (DQ) rules for the MCRE transformed elements
-- Jira: MCMA-4428  (Epic: DQC Document MCRE transformations for DDC, 2026-PI2)
-- Rule list source: MCMA-4427 / New_MCRE_DQ_Rules.xlsx
-- =============================================================================
--
-- Purpose
--   Add DQ "Null Value" checks for the MCRE transformed elements so the rules
--   run on the monthly data and the resulting statistics are recorded in DQ_STAT.
--
-- Definition (from New_MCRE_DQ_Rules.xlsx)
--   sec_dfn_obj_nm      : rec1_sh_mcmads_sec
--   sec_dfn_nm          : mcre_monthly_aggregate_report
--   sec_dfn_eval_typ    : Count
--   sec_dfn_busn_rul_typ: Null Value
--   dimension           : Reliability
--
-- Acceptance criteria (MCMA-4428)
--   1. Add the additional DQ rules alongside the existing DQ rules for the
--      MCRE extract table.
--   2. Each new rule id must be UNIQUE and must not overwrite existing rule ids.
--   3. The query used for each DQ rule must be free of syntax issues.
--   4. The rule must run for the DELTA population only -- i.e. the latest
--      process date (MAX(MCOM_CBE_RPT_PRCS_DT)).
--   5. No impact to the existing process or existing DQ rules.
--
-- NOTE ON COLUMN NAMES
--   The transformed-element column names below were transcribed from screenshots
--   of New_MCRE_DQ_Rules.xlsx and must be reconciled against that workbook before
--   promotion. The rule TEMPLATE / pattern is authoritative; the column list is
--   the part to verify.
-- =============================================================================


-- -----------------------------------------------------------------------------
-- Canonical rule template
-- -----------------------------------------------------------------------------
-- Each DQ rule is a Null-Value Count check on a single transformed column,
-- restricted to the latest process date (delta population):
--
--   SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
--   FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
--   WHERE  <COLUMN> IS NULL
--     AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
--                                  FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);
--
-- A non-zero count indicates rows where the transformed element is NULL for the
-- latest process date and should be flagged by the DQ framework.
-- -----------------------------------------------------------------------------


-- =============================================================================
-- DQ rule definitions
--   Rule id pattern: MCRE_DQ_NULL_<NNN>  (unique, additive -- see criterion #2)
-- =============================================================================

-- MCRE_DQ_NULL_001 : MCI_MCOM_CARD_NOT_PRES_CHRGBK_AM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  MCI_MCOM_CARD_NOT_PRES_CHRGBK_AM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_002 : MCI_MCOM_CARD_NOT_PRES_CHRGBK_AM_NO
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  MCI_MCOM_CARD_NOT_PRES_CHRGBK_AM_NO IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_003 : MCI_MCOM_AVG_CHRGBK_TRAN_AM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  MCI_MCOM_AVG_CHRGBK_TRAN_AM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_004 : MCI_MCOM_MO_EFFCT_BILL_RT
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  MCI_MCOM_MO_EFFCT_BILL_RT IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_005 : MCOM_MO_TRAN_BILL_AM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  MCOM_MO_TRAN_BILL_AM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_006 : MCOM_TRAN_BILL_AM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  MCOM_TRAN_BILL_AM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_007 : PMO_1_CRE_DLVR_DY_NO
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_1_CRE_DLVR_DY_NO IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_008 : PMO_1_CRE_DLVR_DY_AM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_1_CRE_DLVR_DY_AM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_009 : PMO_1_CRE_DLVR_DY_RM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_1_CRE_DLVR_DY_RM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_010 : PMO_1_CRE_TRAN_CHRGBK_RSK_AM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_1_CRE_TRAN_CHRGBK_RSK_AM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_011 : PMO_1_CRE_DLVR_DY_RSK_AM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_1_CRE_DLVR_DY_RSK_AM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_012 : PMO_1_CRE_TRAN_CHRGBK_RSK_RM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_1_CRE_TRAN_CHRGBK_RSK_RM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_013 : PMO_1_CRE_TRAN_CHRGBK_AM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_1_CRE_TRAN_CHRGBK_AM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_014 : PMO_1_CRE_TRAN_REFND_RSK_AM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_1_CRE_TRAN_REFND_RSK_AM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_015 : PMO_1_CRE_TRAN_GROS_AM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_1_CRE_TRAN_GROS_AM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_016 : PMO_1_PROV_GROS_AM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_1_PROV_GROS_AM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_017 : PMO_2_CRE_DLVR_DY_NO
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_2_CRE_DLVR_DY_NO IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_018 : PMO_2_CRE_DLVR_DY_AM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_2_CRE_DLVR_DY_AM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_019 : PMO_2_CRE_DLVR_DY_RM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_2_CRE_DLVR_DY_RM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- MCRE_DQ_NULL_020 : PMO_2_CRE_TRAN_CHRGBK_RSK_AM
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  PMO_2_CRE_TRAN_CHRGBK_RSK_AM IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);

-- =============================================================================
-- End of MCRE DQ rules
-- =============================================================================
