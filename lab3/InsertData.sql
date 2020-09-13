USE master
GO
use [nulplabssql];

IF DB_ID ('nulplabssql') is not null

INSERT INTO [PurchasePlan]
    (title, price, [description])
VALUES
    ('free',0,'Month free trial'),
	('personal',4,'Best for personal use'),
	('premium',8,'Best for freelancers'),
	('business',25,'Best for small businesses'),
	('eCommerce',45,'Best for online stores')
go

INSERT INTO [User]
    (first_name, last_name, public_display_name, about_me, profile_link, [email], [password])
VALUES
    ('Anna','Cyrus','AnnaCyrus',null,'http://twitter.com/AnnaCyrus','AnnaCyrus@yahoo.com',924242967),
	('Anton','Kuziv','Anton1',null,null,'Anton1@ukr.net',165553176),
	('Olga','Kuziv','Olga2',null,null,'Olga2@gmail.com',699887265),
	('Roman','Kuziv','Roman3',null,'http://facebook.com/Roman3','Roman3@gmail.com',372784086),
	('Anna','Cyrus','AnnaCyrus',null,'http://instagram.com/AnnaCyrus','AnnaCyrus@yandex.ru',926495168),
	('Anna','Cyrus','Anna5','Hi people!',null,'Anna5@yandex.ru',740519028),
	('Anton','Snow','AntonSnow','Some info','http://instagram.com/AntonSnow','AntonSnow@yahoo.com',792991819),
	('Alex','Petrenko','AlexPetrenko',null,'http://facebook.com/AlexPetrenko','AlexPetrenko@ukr.net',576021313),
	('Anton','Kuziv','Anton8',null,null,'Anton8@yandex.ru',299048001),
	('Olga','Cyrus','Olga9',null,null,'Olga9@yandex.ru',685302253)
go

INSERT INTO [Follow]
    (id_follower, id_following)
VALUES
    (5,1),
	(4,6),
	(3,6),
	(1,9),
	(8,5),
	(6,7),
	(7,5),
	(4,1),
	(6,2),
	(4,3)
go

INSERT INTO [PurchaseSettings]
    (credit_card, id_user, id_plan)
VALUES
    (793041506,1,3),
	(804946531,2,4),
	(null,3,1),
	(479267001,4,3),
	(595708860,5,4),
	(914969783,6,4),
	(285349779,7,2),
	(460961203,8,2),
	(230697255,9,4),
	(null,10,1)
go

INSERT INTO [Website]
    (title, id_author)
VALUES
    ('Vivamus aliquam odio id nibh bibendum vulputate. ',10),
	('Vivamus quis ipsum tortor. ',4),
	('Vivamus aliquam odio id nibh bibendum vulputate. ',5),
	('Quisque molestie dui nec eleifend. ',8),
	('Sed ultrices risus vitae malesuada.',8),
	('Ut in magna ac ex elementum placerat. ',5),
	('Integer a finibus enim ut blandit turpis. ',6),
	('Vivamus quis ipsum tortor. ',7),
	('Quisque molestie dui nec eleifend. ',1),
	('Quisque molestie dui nec eleifend. ',3)
go

INSERT INTO [ContentBlock]
    ([image], [text], [id_website])
VALUES
    ('https://static.toiimg.com/photo/msid-68523832/68523832.jpg?1137762','Vivamus quis ipsum tortor. Aenean ut sem tincidunt gravida sapien varius porta neque. ',10),
	('https://static.boredpanda.com/blog/wp-content/uploads/2015/07/cutest-sleeping-kitties-ever-106__605.jpg','Donec nec dapibus libero. Vivamus quis ipsum tortor. Ut in magna ac ex elementum placerat. Integer a finibus enim ut blandit turpis. Integer a finibus enim ut blandit turpis. Integer a finibus enim ut blandit turpis. Aenean ut sem tincidunt gravida sapien varius porta neque. Vivamus aliquam odio id nibh bibendum vulputate. Vivamus aliquam odio id nibh bibendum vulputate. Sed ultrices risus ',1),
	('https://previews.123rf.com/images/derketta776/derketta7761908/derketta776190800077/127995966-ginger-cat-s-paw-on-the-blanket-selective-focus.jpg','Vivamus quis ipsum tortor. Vivamus quis ipsum tortor. Aenean ut sem tincidunt gravida sapien varius porta neque. Vivamus quis ipsum tortor. Lorem ipsum dolor sit amet consectetur adipiscing elit. Ut in magna ac ex elementum placerat. Quisque molestie dui nec eleifend. Lorem ipsum dolor sit amet consectetur adipiscing elit. Lorem ipsum dolor sit amet ',2),
	('https://www.wallpaperup.com/uploads/wallpapers/2013/07/26/124262/528e158218788f6413b681af613d6f2f-700.jpg','Quisque molestie dui nec eleifend. Vivamus quis ipsum tortor. Donec nec dapibus libero. Ut in magna ac ex elementum placerat. Vivamus aliquam odio id nibh bibendum vulputate. Sed ultrices risus vitae malesuada bibendum turpis elit aliquam ex facilisis. Donec nec dapibus libero. Lorem ipsum dolor sit amet consectetur adipiscing elit. Vivamus quis ipsum tortor. Quisque molestie dui nec ',3),
	('https://i.pinimg.com/736x/60/d9/26/60d9269a5ada1ee5e2f5161d036209e5.jpg','Ut in magna ac ex elementum placerat. Lorem ipsum dolor sit amet consectetur adipiscing elit. Vivamus quis ipsum tortor. Integer a finibus enim ut blandit turpis. Integer a finibus enim ut blandit turpis. Ut in magna ac ex elementum placerat. Donec nec dapibus libero. Sed ultrices risus vitae malesuada bibendum turpis elit aliquam ex facilisis. Ut in magna ac ex elementum placerat. Quisque molestie dui nec eleifend. ',4),
	('https://static.toiimg.com/photo/msid-68523832/68523832.jpg?1137762','Sed ultrices risus vitae malesuada bibendum turpis elit aliquam ex facilisis. Quisque molestie dui nec eleifend. Aenean ut sem tincidunt gravida sapien varius porta neque. Aenean ut sem tincidunt gravida sapien varius porta neque. Donec nec dapibus libero. Donec nec dapibus libero. Integer a finibus enim ut blandit turpis. Ut in magna ac ex elementum placerat. Quisque molestie dui nec eleifend. Aenean ut sem tincidunt gra',5),
	('https://static.toiimg.com/photo/msid-68523832/68523832.jpg?1137762','Aenean ut sem tincidunt gravida sapien varius porta neque. Ut in magna ac ex elementum placerat. Vivamus quis ipsum tortor. Quisque molestie dui nec eleifend. Donec nec dapibus libero. Quisque molestie dui nec eleifend. Aenean ut sem tincidunt gravida sapien varius porta neque. Donec nec dapibus libero. Quisque molestie dui nec eleifend. Integer a finibus enim ut blandit turpis. Ut in magna ac ex elementum placerat. Quisque ',6),
	('https://static.toiimg.com/photo/msid-68523832/68523832.jpg?1137762','Ut in magna ac ex elementum placerat. Sed ultrices risus vitae malesuada bibendum turpis elit aliquam ex facilisis. Ut in magna ac ex elementum placerat. Quisque molestie dui nec eleifend. Sed ultrices risus vitae malesuada bibendum turpis elit aliquam ex facilisis. Ut in magna ac ex elementum placerat. Aenean ut sem tincidunt gravida sapien varius porta neque. Sed ultrices risus vitae malesuada bibendum turpis elit aliquam ex ',7),
	('https://static.toiimg.com/photo/msid-68523832/68523832.jpg?1137762','Quisque molestie dui nec eleifend. Donec nec dapibus libero. Aenean ut sem tincidunt gravida sapien varius porta neque. Sed ultrices risus vitae malesuada bibendum turpis elit aliquam ex facilisis. Donec nec dapibus libero. Vivamus quis ipsum tortor. Quisque molestie dui nec eleifend. Integer a finibus enim ut blandit turpis. Aenean ut sem tincidunt gravida sapien varius porta neque. Aenean ut sem tincidunt gravida sapien ',8),
	('https://static.toiimg.com/photo/msid-68523832/68523832.jpg?1137762','Ut in magna ac ex elementum placerat. Sed ultrices risus vitae malesuada bibendum turpis ',9)
go

INSERT INTO [SiteSettings]
    (visibility, permalink, allow_comment, [id_website])
VALUES
	('public',675914,1,1),
	('public',276779,0,2),
	('public',451484,0,3),
	('public',228882,0,4),
	('public',1907,0,5),
	('public',747729,0,6),
	('public',634314,0,7),
	('public',715191,1,8),
	('public',828455,0,9),
	('public',952995,1,10)
go

INSERT INTO [Comment]
    (body, [timestamp], [id_author], [id_website])
VALUES
    ('Lorem ipsum dolor sit amet consectetur adipiscing elit. ',2020-08-08,4,5),
	('Vivamus aliquam odio id nibh bibendum vulputate. ',2020-08-24,5,1),
	('Aenean ut sem tincidunt gravida sapien varius porta neque. ',2020-08-19,6,2),
	('Integer a finibus enim ut blandit turpis. ',2020-09-02,3,4),
	('Ut in magna ac ex elementum placerat. ',2020-08-30,3,6),
	('Vivamus quis ipsum tortor. ',2020-09-04,6,9),
	('Integer a finibus enim ut blandit turpis. ',2020-08-09,7,1),
	('Integer a finibus enim ut blandit turpis. ',2020-08-26,8,2),
	('Vivamus quis ipsum tortor. ',2020-08-21,10,7),
	('Vivamus aliquam odio id nibh bibendum vulputate. ',2020-08-26,5,6)
go