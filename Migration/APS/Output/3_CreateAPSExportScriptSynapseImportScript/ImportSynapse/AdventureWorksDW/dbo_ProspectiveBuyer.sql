INSERT INTO [aw].[ProspectiveBuyer]
SELECT * FROM [EXT_aw].[ProspectiveBuyer]
OPTION (LABEL = 'Import_Table_aw.ProspectiveBuyer')
