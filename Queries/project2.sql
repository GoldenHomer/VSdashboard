if OBJECT_ID('addRecords') is not null
drop procedure addRecords
go 
create procedure addRecords
AS
begin
	IF OBJECT_ID('temptable') is not null
	drop table temptable
	declare @lastempid int = (select top 1 empid from namestable order by empid desc)
	declare @lastrecid int = (select top 1 id from salestable order by id desc)

	create table temptable(id int, datesold date, monthonly varchar(50), amount money)
	declare @innercounter = 1
	while @innercounter <= datediff(day, getdate() - datepart(day, getdate()), concat('12/31/', datepart(year, getdate())))

	begin
		insert into temptable values (@lastrecid + @innercounter, @lastempid, getdate() - datepart(day, getdate()) + @innercounter,
			Datename(month, getdate() - datepart(day, getdate()) + @innercounter), rand()*10000)
			set @innercounter = @innercounter + 1
	end

	insert into salestable (id, empid, datesold, monthonly, amount) SELECT id, empid, datesold, monthonly, amount from temptable
end