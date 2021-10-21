CREATE EXTERNAL TABLE [AdventureWorksDW].[EXT_aw].[FactFinance]
WITH (
	LOCATION='/AdventureWorksDW/dbo_FactFinance',
	DATA_SOURCE = AZURE_STAGING_STORAGE,
	FILE_FORMAT = DelimitedFileFormat
	)
AS 
SELECT * FROM [AdventureWorksDW].[dbo].[FactFinance]
OPTION (LABEL = 'Export_Table_AdventureWorksDW.dbo.FactFinance')

