INSERT INTO [aw].[FactInternetSalesReason]
SELECT * FROM [EXT_aw].[FactInternetSalesReason]
OPTION (LABEL = 'Import_Table_aw.FactInternetSalesReason')
