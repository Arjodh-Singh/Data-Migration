INSERT INTO [cso].[DimGeography]
SELECT * FROM [EXT_cso].[DimGeography]
OPTION (LABEL = 'Import_Table_cso.DimGeography')
