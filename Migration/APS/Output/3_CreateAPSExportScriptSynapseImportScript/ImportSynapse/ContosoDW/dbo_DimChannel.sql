INSERT INTO [cso].[DimChannel]
SELECT * FROM [EXT_cso].[DimChannel]
OPTION (LABEL = 'Import_Table_cso.DimChannel')
