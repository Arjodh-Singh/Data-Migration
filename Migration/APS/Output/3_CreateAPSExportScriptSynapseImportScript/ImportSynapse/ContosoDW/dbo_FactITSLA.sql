INSERT INTO [cso].[FactITSLA]
SELECT * FROM [EXT_cso].[FactITSLA]
OPTION (LABEL = 'Import_Table_cso.FactITSLA')
