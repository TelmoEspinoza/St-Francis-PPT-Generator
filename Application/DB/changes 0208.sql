--02/08/26 Changes
--Table Template links to Psalter not to PsalterDetail
--Table Psalter links with Calendar (As well as the usual "PsalterDatail" one)
--Insert into table Template

/*
RELLOCATE Relationship
*/
ALTER TABLE dbo.PsalterDetail DROP CONSTRAINT FK_Template

ALTER TABLE dbo.Psalter ADD CONSTRAINT
	FK_Template FOREIGN KEY
	(
	IdTemplate
	) REFERENCES dbo.Template
	(
	IdTemplate
	) 
GO
DECLARE @v sql_variant 
SET @v = N'Relationship between Psalter and Template.
Psalter has many Template'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Psalter', N'CONSTRAINT', N'FK_Template'


/*
ADD, REMOVE Fields
*/
SELECT * FROM PSALTERDETAIL
ALTER TABLE PSALTERDETAIL
ALTER COLUMN idTemplate int NULL
UPDATE PSALTERDETAIL
SET IdTemplate=NULL

ALTER TABLE PSALTERDETAIL
DROP COLUMN IdTemplate

ALTER TABLE dbo.Psalter
ADD IdTemplate int


/*
Add the right relationship. We need IdPsalter instead
*/
ALTER TABLE dbo.Calendar DROP CONSTRAINT FK_IdPsalterDetail

ALTER TABLE Calendar
DROP COLUMN IdPsalterDetail

ALTER TABLE Calendar 
ADD IdPsalter int


ALTER TABLE dbo.Calendar ADD CONSTRAINT
	FK_Psalter_copy FOREIGN KEY
	(
	IdPsalter
	) REFERENCES dbo.Psalter
	(
	IdPsalter
	) 
GO
DECLARE @v sql_variant 
SET @v = N'ANOTHER Relationship between Calendar and Psalter.
Calendar has many Psalter'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Calendar', N'CONSTRAINT', N'FK_Psalter_copy'


