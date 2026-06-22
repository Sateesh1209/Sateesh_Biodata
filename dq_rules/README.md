# MCRE DDC — DQ Rules for Transformed Elements

Artifact for **Jira MCMA-4428** — *"Dev - MCRE DDC - Add DQ rules for the MCRE
transformed elements."*

> **As a PO, I want to add the DQ rules for the MCRE transformed elements so that
> the DQ rules will run on the monthly data that is generated every month and the
> statistics are documented in the statistics table `DQ_STAT`.**

## Contents

| File | Description |
|------|-------------|
| `mcre_dq_rules.sql` | The DQ rule queries, one Null-Value Count check per transformed column. |
| `mcre_dq_rules_metadata.csv` | Rule-definition metadata mirroring the `sec_dfn_*` columns from `New_MCRE_DQ_Rules.xlsx`. |

## Rule definition

All rules share the same definition, taken from `New_MCRE_DQ_Rules.xlsx`
(provided by the analyst via **MCMA-4427**):

| Attribute | Value |
|-----------|-------|
| `sec_dfn_obj_nm` | `rec1_sh_mcmads_sec` |
| `sec_dfn_nm` | `mcre_monthly_aggregate_report` |
| `sec_dfn_eval_typ` | `Count` |
| `sec_dfn_busn_rul_typ` | `Null Value` |
| Dimension | `Reliability` |

## Rule pattern

Each rule is a Null-Value count on a single transformed column, restricted to
the **delta population** (the latest process date):

```sql
SELECT CONCAT_WS(',', COUNT(*), CAST(COUNT(1) AS STRING))
FROM   rec1_sh_mcmads_sec.mcre_monthly_aggregate_report
WHERE  <COLUMN> IS NULL
  AND  MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(MCOM_CBE_RPT_PRCS_DT)
                               FROM   MCI_SH_MCMADS_SEC.MCRE_MONTHLY_AGGREGATE_REPORT);
```

A non-zero count flags rows where the transformed element is `NULL` for the most
recent process date.

## How this meets the acceptance criteria

1. **Additional rules alongside existing ones** — rules are additive; nothing in
   the existing DQ set is modified.
2. **Unique rule ids** — `MCRE_DQ_NULL_001` … `MCRE_DQ_NULL_020`. Renumber the
   prefix range if it collides with ids already registered in your DQ catalog.
3. **No syntax issues** — every query follows the validated `CONCAT_WS` / `CAST`
   pattern from the source workbook.
4. **Delta population** — the `MCOM_CBE_RPT_PRCS_DT = (SELECT MAX(...))` predicate
   limits each check to the latest process date.
5. **No impact to existing process / rules** — read-only `SELECT` checks; no DDL
   or DML against the source table.

## ⚠️ Before promoting

The transformed-element **column names were transcribed from screenshots** of
`New_MCRE_DQ_Rules.xlsx`. Reconcile the list in `mcre_dq_rules_metadata.csv`
against the authoritative workbook (and confirm the final, unique rule-id range
with the DQ catalog) before loading. The rule **pattern** is authoritative; the
column list is the part to verify.
