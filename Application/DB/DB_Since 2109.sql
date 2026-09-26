/*
21/09/26
--update tables 'Ordo', WeekOrdo=varchar(10)."week34". 'Psalter', Code=varchar(20)."MP(Mon-Fri)"
--Drop table 'Template'; Move that data to table 'Psalter'; 
--Renaming columns in table 'Psalter'; Before->code Now->WeekPsalter
--Rellocate relationship. Before: table 'TypePrayer' link with PsalterDetail Now: It links to table 'Prayer'; 


26/09/26
--Seeding table calendar (a Sample row)
*/

------------------26/09
select * from ordo
select * from Seasons
select * from Psalter
select * from PsalterDetail


CREATE TABLE dbo.SeedingOrdo
	(
	IdWeek int IDENTITY (1,1) PRIMARY KEY,	
	IdPsalter int,
	Description nvarchar(50)
	)  
GO

--insert into SeedingOrdo (IdPsalter, Description) values (1,'Week 1')
insert into SeedingOrdo (IdPsalter, Description) values (2,'Week 2')
insert into SeedingOrdo (IdPsalter, Description) values (3,'Week 3')
insert into SeedingOrdo (IdPsalter, Description) values (4,'Week 4')
insert into SeedingOrdo (IdPsalter, Description) values (1,'Week 5')
insert into SeedingOrdo (IdPsalter, Description) values (2,'Week 6')
insert into SeedingOrdo (IdPsalter, Description) values (3,'Week 7')
insert into SeedingOrdo (IdPsalter, Description) values (4,'Week 8')
insert into SeedingOrdo (IdPsalter, Description) values (1,'Week 9')
insert into SeedingOrdo (IdPsalter, Description) values (2,'Week 10')
insert into SeedingOrdo (IdPsalter, Description) values (3,'Week 11')
insert into SeedingOrdo (IdPsalter, Description) values (4,'Week 12')
insert into SeedingOrdo (IdPsalter, Description) values (1,'Week 13')
insert into SeedingOrdo (IdPsalter, Description) values (2,'Week 14')
insert into SeedingOrdo (IdPsalter, Description) values (3,'Week 15')
insert into SeedingOrdo (IdPsalter, Description) values (4,'Week 16')
insert into SeedingOrdo (IdPsalter, Description) values (1,'Week 17')
insert into SeedingOrdo (IdPsalter, Description) values (2,'Week 18')
insert into SeedingOrdo (IdPsalter, Description) values (3,'Week 19')
insert into SeedingOrdo (IdPsalter, Description) values (4,'Week 20')
insert into SeedingOrdo (IdPsalter, Description) values (1,'Week 21')
insert into SeedingOrdo (IdPsalter, Description) values (2,'Week 22')
insert into SeedingOrdo (IdPsalter, Description) values (3,'Week 23')
insert into SeedingOrdo (IdPsalter, Description) values (4,'Week 24')
insert into SeedingOrdo (IdPsalter, Description) values (1,'Week 25')
insert into SeedingOrdo (IdPsalter, Description) values (2,'Week 26')
insert into SeedingOrdo (IdPsalter, Description) values (3,'Week 27')
insert into SeedingOrdo (IdPsalter, Description) values (4,'Week 28')
insert into SeedingOrdo (IdPsalter, Description) values (1,'Week 29')
insert into SeedingOrdo (IdPsalter, Description) values (2,'Week 30')
insert into SeedingOrdo (IdPsalter, Description) values (3,'Week 31')
insert into SeedingOrdo (IdPsalter, Description) values (4,'Week 32')
insert into SeedingOrdo (IdPsalter, Description) values (1,'Week 33')
insert into SeedingOrdo (IdPsalter, Description) values (2,'Week 34')


select  * from SeedingOrdo



insert into Seasons (Description) values ('OT')

insert into Ordo (IdSeason, WeekOrdo, WeekPsalter,DayInt,Code,Description)
                       SELECT idSeason IdSeason
                            ,(SELECT Description from SeedingOrdo where IdWeek=25) as WeekOrdo
                            ,(SELECT IdPsalter from SeedingOrdo where IdWeek=25) as WeekPsalter
                            ,6 as DayInt
                            ,null as Code
                            ,'Weekday, Ordinary Time 25' as Description
                     FROM Seasons 
                     where Description='OT'
                     
                     



Select * from Ordo
Select * from Calendar

alter table Ordo drop column DayInt

alter table Calendar alter column DayInt int null

--Test
Insert into Psalter (Template, Description, WeekPsalter)
values ('MP Saturdays', 'Test - MP para Saturdays',null)

select * from Psalter order by 1 desc

Insert into Calendar (IdOrdo, Year, Date, Description,IdPsalter)
select O.IdOrdo
       , '2026' as Year
       , CAST(GETDATE() AS DATE) as Date
       , '6 MP - OT Week 25 Saturday' as Description
       , (SELECT IdPsalter from Psalter where Template = 'MP Saturdays') as IdPsalter
from Ordo O


Select * from Calendar






------------------21/09
--DDL
BEGIN TRANSACTION
ALTER TABLE Psalter DROP CONSTRAINT FK_Template
alter table Psalter drop column IdTemplate
alter table Psalter add WeekPsalter int

--Note data types: varchar(10)-->WeekOrdo.It's a label. int--> WeekPsalter
alter table Ordo alter column WeekOrdo varchar(10) not null

EXEC sp_rename 'dbo.Psalter.Code', 'Template', 'COLUMN';

alter table PsalterDetail drop constraint FK_TypePrayer
alter table Prayer drop column IdTypePrayer 
alter table Prayer add IdTypePrayer int 

ALTER TABLE dbo.Prayer ADD CONSTRAINT
	FK_TypePrayer FOREIGN KEY
	(
	IdTypePrayer
	) REFERENCES dbo.TypePrayer
	(
	IdTypePrayer
	) 

--Update PsalterDetail table
ALTER TABLE dbo.PsalterDetail DROP COLUMN IdTypePrayer


COMMIT TRANSACTION


--DML
update Psalter
set Template='MP (Mon-Fri)',
    Description = 'Morning Prayer of the Church'
where IdTemplate=1

update Psalter
set Template='EP (Mon) A4',
    Description = 'Evening Prayer of the Church'
where IdTemplate=8

update Psalter
set Template='EP (Mon)',
    Description = 'Evening Prayer of the Church'
where IdTemplate=9

update Psalter
set Template='EP (Tue-Fri) A4',
    Description = 'Evening Prayer of the Church'
where IdTemplate=10

update Psalter
set Template='EP (Tue-Fri)',
    Description = 'Evening Prayer of the Church'
where IdTemplate=11