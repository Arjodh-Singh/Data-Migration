CREATE EXTERNAL TABLE [EXT_aw].[DimProduct]
(
	[ProductKey] int NOT NULL,
	[ProductAlternateKey] nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductSubcategoryKey] int NULL,
	[WeightUnitMeasureCode] nchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SizeUnitMeasureCode] nchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EnglishProductName] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SpanishProductName] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FrenchProductName] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StandardCost] money NULL,
	[FinishedGoodsFlag] bit NOT NULL,
	[Color] nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SafetyStockLevel] smallint NULL,
	[ReorderPoint] smallint NULL,
	[ListPrice] money NULL,
	[Size] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SizeRange] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Weight] float(53) NULL,
	[DaysToManufacture] int NULL,
	[ProductLine] nchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DealerPrice] money NULL,
	[Class] nchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Style] nchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModelName] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EnglishDescription] nvarchar(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FrenchDescription] nvarchar(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ChineseDescription] nvarchar(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ArabicDescription] nvarchar(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HebrewDescription] nvarchar(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ThaiDescription] nvarchar(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GermanDescription] nvarchar(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JapaneseDescription] nvarchar(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TurkishDescription] nvarchar(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDate] datetime NULL,
	[EndDate] datetime NULL,
	[Status] nvarchar(7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
 WITH (  
                LOCATION='/AdventureWorksDW/dbo_DimProduct',  
                DATA_SOURCE = AZURE_STAGING_STORAGE,  
                FILE_FORMAT = DelimitedFileFormat
)

