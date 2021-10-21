CREATE EXTERNAL TABLE [AdventureWorksDW].[EXT_aw].[DimDate]
WITH (
	LOCATION='/AdventureWorksDW/dbo_DimDate',
	DATA_SOURCE = AZURE_STAGING_STORAGE,
	FILE_FORMAT = DelimitedFileFormat
	)
AS 
SELECT * FROM [AdventureWorksDW].[dbo].[DimDate]
OPTION (LABEL = 'Export_Table_AdventureWorksDW.dbo.DimDate')

