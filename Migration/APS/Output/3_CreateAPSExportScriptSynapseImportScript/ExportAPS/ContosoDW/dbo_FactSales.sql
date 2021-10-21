CREATE EXTERNAL TABLE [ContosoDW].[EXT_cso].[FactSales]
WITH (
	LOCATION='/ContosoDW/dbo_FactSales',
	DATA_SOURCE = AZURE_STAGING_STORAGE,
	FILE_FORMAT = DelimitedFileFormat
	)
AS 
SELECT * FROM [ContosoDW].[dbo].[FactSales]
OPTION (LABEL = 'Export_Table_ContosoDW.dbo.FactSales')

