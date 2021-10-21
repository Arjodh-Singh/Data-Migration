CREATE EXTERNAL TABLE [AdventureWorksDW].[EXT_aw].[DimReseller]
WITH (
	LOCATION='/AdventureWorksDW/dbo_DimReseller',
	DATA_SOURCE = AZURE_STAGING_STORAGE,
	FILE_FORMAT = DelimitedFileFormat
	)
AS 
SELECT * FROM [AdventureWorksDW].[dbo].[DimReseller]
OPTION (LABEL = 'Export_Table_AdventureWorksDW.dbo.DimReseller')

