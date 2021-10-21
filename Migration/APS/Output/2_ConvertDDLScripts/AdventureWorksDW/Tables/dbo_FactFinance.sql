CREATE TABLE aw.[FactFinance]
(
	[FinanceKey] int NOT NULL,
	[DateKey] int NOT NULL,
	[OrganizationKey] int NOT NULL,
	[DepartmentGroupKey] int NOT NULL,
	[ScenarioKey] int NOT NULL,
	[AccountKey] int NOT NULL,
	[Amount] float(53) NOT NULL
)
WITH(CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([FinanceKey]))

