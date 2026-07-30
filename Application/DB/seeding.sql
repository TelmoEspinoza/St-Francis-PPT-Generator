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




--To be able to reuse the labels. They need to have a code.
UPDATE dbo.TypePrayer
SET Code=1 WHERE Description='Caratula'

UPDATE dbo.TypePrayer
SET Code=2 WHERE Description='Introduction'

UPDATE dbo.TypePrayer
SET Code=3 WHERE Description='Invitatory Antiphon'

UPDATE dbo.TypePrayer
SET Code=4 WHERE Description='Hym'

UPDATE dbo.TypePrayer
SET Code=5 WHERE Description='Antiphon 1'

UPDATE dbo.TypePrayer
SET Code=6 WHERE Description='PSALM 100(101)'

UPDATE dbo.TypePrayer
SET Code=7 WHERE Description='Glory be …'

UPDATE dbo.TypePrayer
SET Code=8 WHERE Description='Antiphon'

UPDATE dbo.TypePrayer
SET Code=9 WHERE Description='Antiphon 2'

UPDATE dbo.TypePrayer
SET Code=10 WHERE Description='CANTICLE DAN 3:3,4,6,11-18'

Select IdTypePrayer from TypePrayer
Where Description = 'Glory be …'

Select IdTypePrayer from TypePrayer
Where Description = 'Antiphon'

UPDATE dbo.TypePrayer
SET Code=11 WHERE Description='Antiphon 3'

UPDATE dbo.TypePrayer
SET Code=12 WHERE Description='PSALM 143(144):1-10'

Select IdTypePrayer from TypePrayer
Where Description = 'Glory be …'

Select IdTypePrayer from TypePrayer
Where Description = 'Antiphon'

UPDATE dbo.TypePrayer
SET Code=0 WHERE Description='Is 55:1'
UPDATE dbo.TypePrayer
SET Code=13 WHERE Description='Scripture Reading'

UPDATE dbo.TypePrayer
SET Code=14 WHERE Description='Short Responsory'

UPDATE dbo.TypePrayer
SET Code=15 WHERE Description='Benedictus Antiphon'

UPDATE dbo.TypePrayer
SET Code=16 WHERE Description='Benedictus'

UPDATE dbo.TypePrayer
SET Code=17 WHERE Description='Intercessions'

UPDATE dbo.TypePrayer
SET Code=18 WHERE Description='The Lord’s Prayer'

select * from TypePrayer



--3. Prayer
/*
--MP (Mon-Fri)
*/


SELECT * FROM PRAYER
SELECT * FROM TypePrayer
--delete from PRAYER

--Caratula
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'Morning Prayer of the Church (the Divine Office)' 
        + NCHAR(13) + NCHAR(10)
        + N'Week [....] - Day of the week [....]'
        + NCHAR(13) + NCHAR(10)
        + 'Seson [....]'
        , 'Morning Prayer of...[Week]...[Day]...'
        , Code
FROM dbo.TypePrayer WHERE Description = 'Caratula';

--Introduction
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'Leader: Lord, open our lips.' 
        + NCHAR(13) + NCHAR(10)
        + 'All: And we shall praise your name.'
        , 'Leader: Lord, open our lips...'
        , Code 
FROM dbo.TypePrayer WHERE Description = 'Introduction';


--Invitatory Antiphon
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT   'Response: A mighty God is the Lord: come, let us adore him.' 
        ,'Response: A mighty God is the Lord: come..'
        , Code
FROM dbo.TypePrayer WHERE Description = 'Invitatory Antiphon';

--Hym
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT   'TO DO'
        ,'Father, we praise you, now the night is over,...'
        ,Code
FROM dbo.TypePrayer WHERE Description = 'Hym';

--Antiphon 1
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'I will sing to you, O Lord, and I will walk in the way of perfection.','I will sing to you, O Lord..', Code FROM dbo.TypePrayer WHERE Description = 'Antiphon 1'

--PSALM 100(101)
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'TO DO','My sóng is of mércy and jústice;*', Code FROM dbo.TypePrayer WHERE Description = 'PSALM 100(101)'

--'Glory be …'
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'Leave empty','Leave empty', Code FROM dbo.TypePrayer WHERE Description = 'Glory be …'

--Antiphon: Cierra A1
select p.IdPrayer, p.Description
FROM Prayer p INNER JOIN TypePrayer tp ON p.code=tp.code
where tp.Description = 'Antiphon 1'
and p.Description='I will sing to you, O Lord, and I will walk in the way of perfection.'

--Antiphon 2
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'O Lord, do not withdraw your favour from us.','O Lord, do not withdraw..', Code FROM dbo.TypePrayer WHERE Description = 'Antiphon 2'

--CANTICLE DAN 3:3,4,6,11-18
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'Blessed are you, O Lord, God of our fathers,†','Blessed are you, O Lord,..', Code FROM dbo.TypePrayer WHERE Description = 'CANTICLE DAN 3:3,4,6,11-18'

--Glory be … (Note: Se cruzan por code)
Select p.IdPrayer, p.Description
from Prayer p INNER JOIN TypePrayer tp ON p.code = tp.code
Where tp.Description = 'Glory be …' 

--Antiphon: Cierra A2
select p.IdPrayer, p.Description
FROM Prayer p INNER JOIN TypePrayer tp ON p.code=tp.code
where tp.Description = 'Antiphon 2'
and p.Description='O Lord, do not withdraw your favour from us.'

--Antiphon 3
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'I will sing a new song to you, O God.','I will sing a...', Code FROM dbo.TypePrayer WHERE Description = 'Antiphon 3'

--PSALM 143(144):1-10
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'TO DO','Bléssed be the Lórd, my rock†', Code FROM dbo.TypePrayer WHERE Description = 'PSALM 143(144):1-10'

--Glory be … (Note: Se cruzan por code)
Select p.IdPrayer, p.Description
from Prayer p INNER JOIN TypePrayer tp ON p.code = tp.code
Where tp.Description = 'Glory be …' 

--Antiphon: Cierra A3
select p.IdPrayer, p.Description
FROM Prayer p INNER JOIN TypePrayer tp ON p.code=tp.code
where tp.Description = 'Antiphon 3'
and p.Description='I will sing a new song to you, O God.'

--Scripture Reading
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'Is 55:1 (Note: Figure this out)','Is 55:1 (Note: Figure this out)', Code FROM dbo.TypePrayer WHERE Description = 'Scripture Reading'

select * from Prayer
order by 1 desc
select * from TypePrayer

--Short Responsory
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'Hear my cry, Lord, for I hope in your word.','Hear my cry, Lord,...', Code FROM dbo.TypePrayer WHERE Description = 'Short Responsory'

--Benedictus Antiphon (A4)
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'Lord, save us from the hands of all who hate us.','Lord, save us...', Code FROM dbo.TypePrayer WHERE Description = 'Benedictus Antiphon'

--Benedictus
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'Blessed + be the Lord, the God of Israel!*','Blessed + be the Lord,...', Code FROM dbo.TypePrayer WHERE Description = 'Benedictus'

--Antiphon: Cierra A4
select p.IdPrayer, p.Description
FROM Prayer p INNER JOIN TypePrayer tp ON p.code=tp.code
where tp.Description = 'Benedictus Antiphon'
and p.Description='Lord, save us from the hands of all who hate us.'

--Intercessions
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'Response:' 
        + NCHAR(13) + NCHAR(10)
        + 'Stay with us, Lord, on our journey.'        
        ,'Response:...<Enter>'
        , Code 
FROM dbo.TypePrayer WHERE Description = 'Intercessions'


--The Lord’s Prayer
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'Our Father…','Our Father…', Code FROM dbo.TypePrayer WHERE Description = 'The Lord’s Prayer'


--Intercessions
INSERT INTO dbo.Prayer (Description, DescriptionShort, Code)
SELECT 'Response:' 
        + NCHAR(13) + NCHAR(10)
        + 'Stay with us, Lord, on our journey.'        
        ,'Response:...<Enter>'
        , Code 
FROM dbo.TypePrayer WHERE Description = 'Concluding Prayer'

--FIGURIT OUT
--* Concluding Prayer
/*
....
..
..
--EP (Mon-Fri)
...
...
...
*/


--4. Template
INSERT INTO dbo.Template (Description, code)
VALUES ('MP (Mon-Fri)'
        ,1
       )

INSERT INTO dbo.Template (Description, code)
VALUES ('EP (Mon-Fri)'
        ,2
       )

INSERT INTO dbo.Template (Description, code)
VALUES ('EP (Mon-Fri) OT'
        ,3
       )

Select * from Template