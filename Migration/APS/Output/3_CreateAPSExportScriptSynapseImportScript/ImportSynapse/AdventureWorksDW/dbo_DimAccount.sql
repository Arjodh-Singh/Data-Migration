INSERT INTO [aw].[DimAccount]
SELECT * FROM [EXT_aw].[DimAccount]
OPTION (LABEL = 'Import_Table_aw.DimAccount')
