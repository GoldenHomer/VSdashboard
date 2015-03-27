-- This query isn't doing what I want it to do. Fix it.
USE samp
GO

IF OBJECT_ID('Summary') IS NOT NULL
DROP PROCEDURE Summary
GO
CREATE PROCEDURE Summary
AS
BEGIN
	IF OBJECT_ID('summarytable') IS NOT NULL
	DROP TABLE summarytable

	SELECT empid, sum(amount) AS 'Total', AVG(amount) AS 'Daily Average', monthonly into summarytable
	FROM salestable
	GROUP BY empid, monthonly
	/*
	IF OBJECT_ID('namesandtotals') IS NOT NULL
	DROP TABLE namesandtotals
	*/

	SELECT namestable.name, namestable.empid, summarytable.monthonly, total, [Daily Average]
	INTO namesandtotals FROM namestable
	INNER JOIN summarytable ON
	namestable.empid = summarytable.empid
END
GO
