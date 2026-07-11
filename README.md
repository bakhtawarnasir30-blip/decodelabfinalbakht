Data Cleaning & Preparation - Change Log
Project 1 | Dataset: Dataset_for_Data_Analytics.xlsx | 1,200 order records | DecodeLabs Industrial Training Kit
Summary
A full audit of the raw dataset was performed covering duplicate detection, missing-value handling, date/number format standardization, text normalization, and cross-field business-rule validation. The table below documents every check   performed and any corrective action taken, per the stakeholder accountability requirement (what changed and why).

Change ID	Description	Impact	Status
CR001	Audited for duplicate rows and duplicate OrderIDs	Found 0 duplicate rows, 0 duplicate OrderIDs (dataset was already unique)	Verified
CR002	Imputed missing 'CouponCode' values	309 blank records (orders with no coupon  applied) set to "No Coupon" for consistency	Resolved

CR003	Corrected 'TotalPrice' numeric precision	29 records had floating-point rounding   artifacts beyond 2 decimals; rounded to standard currency precision (2 decimals)	
Resolved

CR004	Standardized 'Date' field to ISO 8601 (YYYY-MM-DD)	0 unparseable dates found; all dates  normalized to ISO 8601 text format for consistency	
Resolved

CR005	Trimmed whitespace and verified text casing on all categorical/ID fields	0 cell(s) had leading/trailing whitespace requiring trimming; casing was already consistent across all category values	
Verified
CR006	Validated 'TotalPrice' = Quantity x UnitPrice business rule	0 records failed the cross-field validation check	Verified
CR007	Checked for negative or zero values in Quantity, UnitPrice, TotalPrice	0 invalid (negative/zero) numeric records found	Verified
CR008	Final verification gate check	Duplicate ID error rate: 0.0% | Incorrect date
format error rate: 0.0%	Passed


Verification Gate (Project 2 Threshold)

Check	Result	Status
Duplicate Order IDs	0 of 1,200 (0.0%)	Pass
Incorrectly formatted dates	0 of 1,200 (0.0%)	Pass

Both zero-error thresholds required to advance to Project 2 have been met.


Methodology Notes

- Missing values: Listwise deletion was avoided per best practice. The only field with nulls was CouponCode (309 records) which represents orders where no coupon was applied - these were labeled 'No Coupon' rather than dropped, preserving all 1,200 records.
- Duplicates: Checked both for fully duplicated rows and duplicate unique identifiers (OrderID, TrackingNumber). None were found; the source data was already unique.
- Formats: Date field standardized to ISO 8601 (YYYY-MM-DD). Currency fields (TotalPrice) rounded to 2 decimal places to remove floating-point artifacts (29 records affected). Text fields checked for whitespace and casing inconsistencies.
- Business rules: Cross-validated TotalPrice against Quantity x UnitPrice, and Quantity against ItemsInCart, to confirm internal consistency of every record.
