USE samp
GO
IF OBJECT_ID('deleterecords') IS NOT NULL
DROP PROCEDURE deleterecords
GO
CREATE PROCEDURE deleterecords
AS
BEGIN
	IF OBJECT_ID('backupsalestable') IS NOT NULL
		DROP TABLE backupsalestable
		SELECT * INTO backupsalestable FROM salestable
	DELETE FROM salestable WHERE empid NOT IN (SELECT empid FROM namestable)
END