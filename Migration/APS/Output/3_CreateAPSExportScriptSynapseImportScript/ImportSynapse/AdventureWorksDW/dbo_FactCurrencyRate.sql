INSERT INTO [aw].[FactCurrencyRate]
SELECT * FROM [EXT_aw].[FactCurrencyRate]
OPTION (LABEL = 'Import_Table_aw.FactCurrencyRate')
