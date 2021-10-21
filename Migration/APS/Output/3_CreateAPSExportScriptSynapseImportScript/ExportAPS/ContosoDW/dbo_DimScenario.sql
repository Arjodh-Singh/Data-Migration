CREATE EXTERNAL TABLE [ContosoDW].[EXT_cso].[DimScenario]
WITH (
	LOCATION='/ContosoDW/dbo_DimScenario',
	DATA_SOURCE = AZURE_STAGING_STORAGE,
	FILE_FORMAT = DelimitedFileFormat
	)
AS 
SELECT * FROM [ContosoDW].[dbo].[DimScenario]
OPTION (LABEL = 'Export_Table_ContosoDW.dbo.DimScenario')

