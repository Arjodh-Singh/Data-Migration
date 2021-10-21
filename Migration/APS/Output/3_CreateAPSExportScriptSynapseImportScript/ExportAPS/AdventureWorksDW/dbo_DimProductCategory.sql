CREATE EXTERNAL TABLE [AdventureWorksDW].[EXT_aw].[DimProductCategory]
WITH (
	LOCATION='/AdventureWorksDW/dbo_DimProductCategory',
	DATA_SOURCE = AZURE_STAGING_STORAGE,
	FILE_FORMAT = DelimitedFileFormat
	)
AS 
SELECT * FROM [AdventureWorksDW].[dbo].[DimProductCategory]
OPTION (LABEL = 'Export_Table_AdventureWorksDW.dbo.DimProductCategory')

