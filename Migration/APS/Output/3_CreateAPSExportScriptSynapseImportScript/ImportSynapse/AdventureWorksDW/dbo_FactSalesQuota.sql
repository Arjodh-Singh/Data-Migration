INSERT INTO [aw].[FactSalesQuota]
SELECT * FROM [EXT_aw].[FactSalesQuota]
OPTION (LABEL = 'Import_Table_aw.FactSalesQuota')
