CREATE TABLE [dbo].[FactResellerSales]
(
	[ProductKey] int NOT NULL,
	[OrderDateKey] int NOT NULL,
	[DueDateKey] int NOT NULL,
	[ShipDateKey] int NOT NULL,
	[ResellerKey] int NOT NULL,
	[EmployeeKey] int NOT NULL,
	[PromotionKey] int NOT NULL,
	[CurrencyKey] int NOT NULL,
	[SalesTerritoryKey] int NOT NULL,
	[SalesOrderNumber] nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SalesOrderLineNumber] tinyint NOT NULL,
	[RevisionNumber] tinyint NULL,
	[OrderQuantity] smallint NULL,
	[UnitPrice] money NULL,
	[ExtendedAmount] money NULL,
	[UnitPriceDiscountPct] float(53) NULL,
	[DiscountAmount] float(53) NULL,
	[ProductStandardCost] money NULL,
	[TotalProductCost] money NULL,
	[SalesAmount] money NULL,
	[TaxAmt] money NULL,
	[Freight] money NULL,
	[CarrierTrackingNumber] nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerPONumber] nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
WITH(CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([OrderDateKey]), 
	PARTITION ([OrderDateKey] RANGE RIGHT FOR VALUES (20000101, 20010101, 20020101, 20030101, 20040101, 20050101, 20060101, 20070101, 20080101, 20090101, 20100101, 20110101, 20120101, 20130101, 20140101, 20150101, 20160101, 20170101, 20180101, 20190101, 20200101, 20210101, 20220101, 20230101, 20240101, 20250101, 20260101, 20270101, 20280101, 20290101)))
