INSERT INTO [aw].[DimDate]
SELECT * FROM [EXT_aw].[DimDate]
OPTION (LABEL = 'Import_Table_aw.DimDate')
