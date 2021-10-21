CREATE EXTERNAL TABLE [ContosoDW].[EXT_cso].[DimCurrency]
WITH (
	LOCATION='/ContosoDW/dbo_DimCurrency',
	DATA_SOURCE = AZURE_STAGING_STORAGE,
	FILE_FORMAT = DelimitedFileFormat
	)
AS 
SELECT * FROM [ContosoDW].[dbo].[DimCurrency]
OPTION (LABEL = 'Export_Table_ContosoDW.dbo.DimCurrency')

