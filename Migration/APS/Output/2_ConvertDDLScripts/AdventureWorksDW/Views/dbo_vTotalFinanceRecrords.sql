CREATE VIEW aw.[vTotalFinanceRecrords] AS select count(*) as [TotalFinanceRecords] from aw.FactFinance where Amount > (select avg(amount) from aw.FactFinance);

