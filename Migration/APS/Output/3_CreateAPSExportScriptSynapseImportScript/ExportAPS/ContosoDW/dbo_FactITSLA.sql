CREATE EXTERNAL TABLE [ContosoDW].[EXT_cso].[FactITSLA]
WITH (
	LOCATION='/ContosoDW/dbo_FactITSLA',
	DATA_SOURCE = AZURE_STAGING_STORAGE,
	FILE_FORMAT = DelimitedFileFormat
	)
AS 
SELECT * FROM [ContosoDW].[dbo].[FactITSLA]
OPTION (LABEL = 'Export_Table_ContosoDW.dbo.FactITSLA')

