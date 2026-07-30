/*
SEEDING:	28/07/26. v1
			30/07/26. v2
*/

USE SFPPTS

--1. Psalter
INSERT INTO dbo.Psalter (Code, Description)
VALUES (1,'Week1')
INSERT INTO dbo.Psalter (Code, Description)
VALUES (2,'Week2')
INSERT INTO dbo.Psalter (Code, Description)
VALUES (3,'Week3')
INSERT INTO dbo.Psalter (Code, Description)
VALUES (4,'Week4')

Select * from Psalter


--2. TypePrayer (I.O.W. Labels)
--Delete from TypePrayer


/*
--MP (Mon-Fri)
*/
INSERT INTO dbo.TypePrayer (Description)
VALUES ('Caratula')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Introduction')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Invitatory Antiphon')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Hym')


INSERT INTO dbo.TypePrayer (Description)
VALUES ('Antiphon 1')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('PSALM 100(101)')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Glory be …')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Antiphon')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Antiphon 2')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('CANTICLE DAN 3:3,4,6,11-18')

Select IdTypePrayer from TypePrayer
Where Description = 'Glory be …'

Select IdTypePrayer from TypePrayer
Where Description = 'Antiphon'

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Antiphon 3')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('PSALM 143(144):1-10')

Select IdTypePrayer from TypePrayer
Where Description = 'Glory be …'

Select IdTypePrayer from TypePrayer
Where Description = 'Antiphon'

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Is 55:1')
INSERT INTO dbo.TypePrayer (Description)
VALUES ('Scripture Reading')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Short Responsory')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Benedictus Antiphon')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Benedictus')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Intercessions')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('The Lord’s Prayer')

INSERT INTO dbo.TypePrayer (Description)
VALUES (
        N'Concluding Prayer' 
        + NCHAR(13) + NCHAR(10)
        + N'Blessings, Invocation and Dismissal'
        )
select * from TypePrayer


/*
---EP (Mon-Fri)
*/


Select IdTypePrayer from TypePrayer
Where Description = 'Caratula'

Select IdTypePrayer from TypePrayer
Where Description = 'Introduction'

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Glory be … Alleluia!')

Select IdTypePrayer from TypePrayer
Where Description = 'Hym'

Select IdTypePrayer from TypePrayer
Where Description = 'Antiphon 1'

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Psalm 136 (137):1-6')

Select IdTypePrayer from TypePrayer
Where Description = 'Glory be …'

Select IdTypePrayer from TypePrayer
Where Description = 'Antiphon'

Select IdTypePrayer from TypePrayer
Where Description = 'Antiphon 2'

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Psalm 137 (138)')

Select IdTypePrayer from TypePrayer
Where Description = 'Glory be …'

Select IdTypePrayer from TypePrayer
Where Description = 'Antiphon'

Select IdTypePrayer from TypePrayer
Where Description = 'Antiphon 3'

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Canticle: Rev 4:11; 5:9, 10, 12')

Select IdTypePrayer from TypePrayer
Where Description = 'Glory be …'

Select IdTypePrayer from TypePrayer
Where Description = 'Antiphon'

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Col 3:16')
Select IdTypePrayer from TypePrayer
Where Description = 'Scripture Reading'

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Magnificat Antiphon')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Magnificat AHB109')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Magnificat AHB 210(i)')

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Gather 14')

Select IdTypePrayer from TypePrayer
Where Description = 'Magnificat Antiphon'


Select IdTypePrayer from TypePrayer
Where Description = 'Intercessions'

Select IdTypePrayer from TypePrayer
Where Description = 'The Lord’s Prayer'

Select IdTypePrayer from TypePrayer
Where Description like 'Concluding%'

INSERT INTO dbo.TypePrayer (Description)
VALUES ('Anthem to the Blessed Virgin Mary')

Select IdTypePrayer from TypePrayer
Where Description = 'Caratula'

--------------------------------EXPLANATION


Select * from Psalter

Select * from TypePrayer