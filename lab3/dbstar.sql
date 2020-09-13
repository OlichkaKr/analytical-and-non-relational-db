use master
go
IF DB_ID ('dbstar') IS NOT NULL
DROP DATABASE [dbstar];
go
create database [dbstar];
go
use [dbstar];
go

CREATE TABLE [Popularity] (
	[comment_id] int,
	[user_id] int,
	[website_id] int,
	[block_id] int,
	[visitors] int
);

CREATE TABLE [User] (
	[id] int NOT NULL PRIMARY KEY,
	[first_name] varchar(100) NOT NULL,
	[last_name] varchar(100) NOT NULL,
	[public_display_name] varchar(100) NOT NULL,
	[about_me] varchar(100) NULL,
	[profile_link] varchar(100) NULL,
	[email] varchar(100) NOT NULL,
	[password] varchar(100) NOT NULL
);

CREATE TABLE [Websites] (
	[id] int NOT NULL PRIMARY KEY,
	[title] varchar(50) NOT NULL
);

CREATE TABLE [Comment](
	[id] int NOT NULL PRIMARY KEY,
	[body] varchar(500) NOT NULL,
	[timestamp] datetime NOT NULL
);

CREATE TABLE [ContentBlock] (
	[id] int NOT NULL PRIMARY KEY,
	[image] varchar(500) NULL,
	[text] varchar(500) NULL
);

ALTER TABLE [Popularity]
	ADD CONSTRAINT FK_ContentBlocks_Popularity FOREIGN KEY ([block_id]) REFERENCES [ContentBlock] ([id]);

ALTER TABLE [Popularity]
	ADD CONSTRAINT FK_Comments_Popularity FOREIGN KEY ([comment_id]) REFERENCES [Comment] ([id]);

ALTER TABLE [Popularity]
	ADD CONSTRAINT FK_Websites_Popularity FOREIGN KEY ([website_id]) REFERENCES [Websites] ([id]);

ALTER TABLE [Popularity]
	ADD CONSTRAINT FK_Users_Popularity FOREIGN KEY ([user_id]) REFERENCES [User] ([id]);
