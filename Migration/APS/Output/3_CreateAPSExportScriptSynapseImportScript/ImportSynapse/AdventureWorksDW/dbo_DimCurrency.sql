INSERT INTO [aw].[DimCurrency]
SELECT * FROM [EXT_aw].[DimCurrency]
OPTION (LABEL = 'Import_Table_aw.DimCurrency')
