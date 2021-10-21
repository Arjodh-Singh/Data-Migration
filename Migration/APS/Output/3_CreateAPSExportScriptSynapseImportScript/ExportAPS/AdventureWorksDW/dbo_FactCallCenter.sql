CREATE EXTERNAL TABLE [AdventureWorksDW].[EXT_aw].[FactCallCenter]
WITH (
	LOCATION='/AdventureWorksDW/dbo_FactCallCenter',
	DATA_SOURCE = AZURE_STAGING_STORAGE,
	FILE_FORMAT = DelimitedFileFormat
	)
AS 
SELECT * FROM [AdventureWorksDW].[dbo].[FactCallCenter]
OPTION (LABEL = 'Export_Table_AdventureWorksDW.dbo.FactCallCenter')

