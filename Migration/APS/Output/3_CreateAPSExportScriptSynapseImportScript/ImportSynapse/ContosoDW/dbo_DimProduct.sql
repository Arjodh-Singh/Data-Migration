INSERT INTO [cso].[DimProduct]
SELECT * FROM [EXT_cso].[DimProduct]
OPTION (LABEL = 'Import_Table_cso.DimProduct')
