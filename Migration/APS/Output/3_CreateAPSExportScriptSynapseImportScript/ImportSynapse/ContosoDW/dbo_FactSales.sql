INSERT INTO [cso].[FactSales]
SELECT * FROM [EXT_cso].[FactSales]
OPTION (LABEL = 'Import_Table_cso.FactSales')
