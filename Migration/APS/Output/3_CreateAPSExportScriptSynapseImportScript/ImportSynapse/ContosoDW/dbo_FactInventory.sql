INSERT INTO [cso].[FactInventory]
SELECT * FROM [EXT_cso].[FactInventory]
OPTION (LABEL = 'Import_Table_cso.FactInventory')
