CREATE VIEW [vTotalFinanceRecrords] AS select count(*) as [TotalFinanceRecords] from FactFinance where Amount > (select avg(amount) from FactFinance);
