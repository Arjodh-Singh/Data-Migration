INSERT INTO [cso].[DimStore]
SELECT * FROM [EXT_cso].[DimStore]
OPTION (LABEL = 'Import_Table_cso.DimStore')
