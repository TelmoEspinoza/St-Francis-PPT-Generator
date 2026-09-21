/*
21/09/26
--update tables 'Ordo', WeekOrdo=varchar(10)."week34". 'Psalter', Code=varchar(20)."MP(Mon-Fri)"
--Drop table 'Template'; Move that data to table 'Psalter'; 
--Renaming columns in table 'Psalter'; Before->code Now->WeekPsalter
--Rellocate relationship. Before: table 'TypePrayer' link with PsalterDetail Now: It links to table 'Prayer'; 


*/

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