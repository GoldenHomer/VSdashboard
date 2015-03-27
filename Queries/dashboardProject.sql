USE samp
GO

if OBJECT_ID('salestable') is not null
	drop table salestable
if OBJECT_ID('namestable') is not null
	drop table namestable

create table namestable(empid int identity(1,1) not null primary key, name varchar(50))
insert into namestable (name) values('John')
insert into namestable (name) values('Steve')
select * from namestable

CREATE TABLE salestable(id int identity(1,1) not null primary key, empid int, datesold date, monthonly varchar(50), amount money)

declare @outercounter int = 1
declare @innercounter int = 1

while @outercounter <= (select count(name) from namestable)
begin
	while @innercounter <= DATEDIFF(day, getdate() - datepart(day, getdate()), Concat('12/31/', Datepart(year, getdate())))
	begin
		INSERT INTO salestable (empid, datesold, monthonly, amount)
			VALUES(@outercounter, getdate() - datepart(day, getdate()) + @innercounter,
			Datename(month, getdate() - datepart(day, getdate()) + @innercounter), rand()*10000)
			set @innercounter = @innercounter+1
	end

	set @outercounter = @outercounter + 1
	set @innercounter = 1
end

select * from salestable

go
if OBJECT_ID('updatenamesgetnewrecordsappend') is not null
drop trigger updatenamesgetnewrecordsappend

go
create trigger updatenamesgetnewrecordsappend
on dbo.namestable
after insert
	as
		set identity_insert dbo.salestable on
		exec addRecords
		exec Summary