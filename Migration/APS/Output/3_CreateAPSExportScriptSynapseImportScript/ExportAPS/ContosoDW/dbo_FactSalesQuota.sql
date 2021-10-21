CREATE EXTERNAL TABLE [ContosoDW].[EXT_cso].[FactSalesQuota]
WITH (
	LOCATION='/ContosoDW/dbo_FactSalesQuota',
	DATA_SOURCE = AZURE_STAGING_STORAGE,
	FILE_FORMAT = DelimitedFileFormat
	)
AS 
SELECT * FROM [ContosoDW].[dbo].[FactSalesQuota]
OPTION (LABEL = 'Export_Table_ContosoDW.dbo.FactSalesQuota')

