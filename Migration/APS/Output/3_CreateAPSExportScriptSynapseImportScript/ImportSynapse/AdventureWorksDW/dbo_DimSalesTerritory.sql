INSERT INTO [aw].[DimSalesTerritory]
SELECT * FROM [EXT_aw].[DimSalesTerritory]
OPTION (LABEL = 'Import_Table_aw.DimSalesTerritory')
