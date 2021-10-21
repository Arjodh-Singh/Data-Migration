CREATE EXTERNAL TABLE [AdventureWorksDW].[EXT_aw].[DatabaseLog]
WITH (
	LOCATION='/AdventureWorksDW/dbo_DatabaseLog',
	DATA_SOURCE = AZURE_STAGING_STORAGE,
	FILE_FORMAT = DelimitedFileFormat
	)
AS 
SELECT * FROM [AdventureWorksDW].[dbo].[DatabaseLog]
OPTION (LABEL = 'Export_Table_AdventureWorksDW.dbo.DatabaseLog')

