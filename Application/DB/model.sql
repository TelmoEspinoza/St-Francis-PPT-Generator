
/* DataModel 27/07/26. v1
   DataModel 30/07/26. v2*/


/****************************
CREATE DATABASE
*****************************/
CREATE DATABASE [SFPPTS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SFPPTS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\SFPPTS.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SFPPTS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\SFPPTS_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 WITH LEDGER = OFF
GO


USE [SFPPTS]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [SFPPTS] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO


/******************************
CREATE TABLES
*******************************/

/*1. Psalter*/
--Description: Week4
CREATE TABLE dbo.Psalter
	(
	IdPsalter int IDENTITY (1,1) PRIMARY KEY,
	Code int,
	Description nvarchar(50)
	)  
GO



/*2. TypePrayer */
--Description: MP Monday to Friday; EP Monday to Friday; EP Monday OT
CREATE TABLE dbo.TypePrayer
	(
	IdTypePrayer int IDENTITY (1,1) PRIMARY KEY,
	Code INT NULL,
	Description nvarchar(MAX) NOT NULL
	)  

/*3. Prayer*/
CREATE TABLE dbo.Prayer
	(
	IdPrayer int IDENTITY (1,1) PRIMARY KEY,
    Code int,
    Description nvarchar(MAX) NOT NULL, 
	DescriptionShort varchar(50)
	)
GO

/*4. Template*/
--MP (Mon-Fri); EP(Mon-Fri);EP(Monday)
CREATE TABLE dbo.Template
	(
	IdTemplate int IDENTITY (1,1) PRIMARY KEY,
	Code int,
	Description varchar(50) NOT NULL
	)
GO


/*5. PsalterDetail*/
--Description: Psalter4 Tuesday MP
CREATE TABLE dbo.PsalterDetail
	(
	IdPsalterDetail int IDENTITY (1,1) PRIMARY KEY,
	IdPsalter int NOT NULL,
	IdTemplate int NOT NULL,
	IdTypePrayer int NOT NULL,
	IdPrayer int NOT NULL,
	DayInt int NOT NULL,		
	Description varchar(50) NOT NULL,	
	Position int	
	)
GO

ALTER TABLE dbo.PsalterDetail ADD CONSTRAINT
	FK_Psalter FOREIGN KEY
	(
	IdPsalter
	) REFERENCES dbo.Psalter
	(
	IdPsalter
	) 
GO
DECLARE @v sql_variant 
SET @v = N'Relationship between PsalterDetail and Psalter.
Psalter has many details
TypeStructure=MP,EP'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'PsalterDetail', N'CONSTRAINT', N'FK_Psalter'


ALTER TABLE dbo.PsalterDetail ADD CONSTRAINT
	FK_Template FOREIGN KEY
	(
	IdTemplate
	) REFERENCES dbo.Template
	(
	IdTemplate
	) 
GO
DECLARE @v sql_variant 
SET @v = N'Relationship between PsalterDetail and Template.
PsalterDetail has many Template'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'PsalterDetail', N'CONSTRAINT', N'FK_Template'



ALTER TABLE dbo.PsalterDetail ADD CONSTRAINT
	FK_TypePrayer FOREIGN KEY
	(
	IdPrayer
	) REFERENCES dbo.TypePrayer
	(
	IdTypePrayer
	) 	
GO
DECLARE @v sql_variant 
SET @v = N'Relationship between PsalterDetail and TypePrayer
PsalterDetail has many TypePrayer'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'PsalterDetail', N'CONSTRAINT', N'FK_TypePrayer'

ALTER TABLE dbo.PsalterDetail ADD CONSTRAINT
	FK_Prayer FOREIGN KEY
	(
	IdPrayer
	) REFERENCES dbo.Prayer
	(
	IdPrayer
	)	
GO
DECLARE @v sql_variant 
SET @v = N'Relationship between PsalterDetail and Prayer
PsalterDetail has many Prayers'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'PsalterDetail', N'CONSTRAINT', N'FK_Prayer'


/*6. Seasons*/
CREATE TABLE dbo.Seasons
	(
	IdSeason int IDENTITY (1,1) PRIMARY KEY,
	Code int,
	Description varchar(50) NOT NULL
	)  

/*7. Ordo*/
--Desciption: OT Week 16, Tuesday
--Code: I'ts the year. Eg. 2026
CREATE TABLE dbo.Ordo
	(
	IdOrdo int IDENTITY (1,1) PRIMARY KEY,
	IdSeason int NOT NULL,
	WeekOrdo int NOT NULL,
	WeekPsalter int NOT NULL,
	DayInt int NOT NULL,
	Code int,
	Description nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Ordo ADD CONSTRAINT
	FK_Seasons FOREIGN KEY
	(
	IdSeason
	) REFERENCES dbo.Seasons
	(
	IdSeason
	) 
GO
DECLARE @v sql_variant 
SET @v = N'Relation between Ordo and Seasons.
ORDO has many seasons'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Ordo', N'CONSTRAINT', N'FK_Seasons'


/*8.Calendar*/
--Desciption: USB Name. 245  MP - OT Week 16, Tuesday.pptx
CREATE TABLE dbo.Calendar
	(
	IdCalendar int IDENTITY (1,1) PRIMARY KEY,
	IdOrdo int NOT NULL,
	IdPsalterDetail int NOT NULL,
	Year int NOT NULL,
	Date date NULL,
	DayInt int NOT NULL,
	Description varchar(50)
	)
GO

ALTER TABLE dbo.Calendar ADD CONSTRAINT
	FK_Ordo FOREIGN KEY
	(
	IdOrdo
	) REFERENCES dbo.Ordo
	(
	IdOrdo
	) 	
GO
DECLARE @v sql_variant 
SET @v = N'Relationship between Calendar and ORDO.
Calendar has many ORDO'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Calendar', N'CONSTRAINT', N'FK_Ordo'
GO

ALTER TABLE dbo.Calendar ADD CONSTRAINT
	FK_PsalterDetail FOREIGN KEY
	(
	IdPsalterDetail
	) REFERENCES dbo.PsalterDetail
	(
	IdPsalterDetail
	) 	
GO
DECLARE @v sql_variant 
SET @v = N'Relationship between Calendar and Psalter Detail.
Calendar has many PsalterDetail'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Calendar', N'CONSTRAINT', N'FK_PsalterDetail'
