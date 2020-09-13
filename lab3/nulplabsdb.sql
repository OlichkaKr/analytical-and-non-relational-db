use master
go
IF DB_ID ('nulplabssql') IS NOT NULL
DROP DATABASE [nulplabssql];
go
create database [nulplabssql];
go
use [nulplabssql];
go


CREATE TABLE [dbo].[Comment](
	[id] [int] NOT NULL IDENTITY(1,1),
	[body] [varchar](500) NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[id_author] [int] NULL,
	[id_website] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentBlock]    Script Date: 28.05.2020 1:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentBlock](
	[id] [int] NOT NULL IDENTITY(1,1),
	[image] [varchar](500) NULL,
	[text] [varchar](500) NULL,
	[id_website] [int] NOT NULL,
 CONSTRAINT [PK_ContentBlock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follow]    Script Date: 28.05.2020 1:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follow](
	[id] [int] NOT NULL IDENTITY(1,1),
	[id_follower] [int] NULL,
	[id_following] [int] NULL,
 CONSTRAINT [PK_Follow] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchasePlan]    Script Date: 28.05.2020 1:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchasePlan](
	[id] [int] NOT NULL IDENTITY(1,1),
	[title] [varchar](100) NOT NULL,
	[price] [int] NOT NULL,
	[description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_PurchasePlan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseSettings]    Script Date: 28.05.2020 1:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseSettings](
	[id] [int] NOT NULL IDENTITY(1,1),
	[credit_card] [int] NULL,
	[id_user] [int] NULL,
	[id_plan] [int] NULL,
 CONSTRAINT [PK_PurchaseSettings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiteSettings]    Script Date: 28.05.2020 1:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteSettings](
	[id] [int] NOT NULL IDENTITY(1,1),
	[visibility] [varchar](100) NOT NULL,
	[permalink] [varchar](100) NOT NULL,
	[allow_comment] [varchar](100) NOT NULL,
	[id_website] [int] NULL,
 CONSTRAINT [PK_SiteSettings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_SiteSettings] UNIQUE NONCLUSTERED 
(
	[id_website] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28.05.2020 1:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] NOT NULL IDENTITY(1,1),
	[first_name] [varchar](100) NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[public_display_name] [varchar](100) NOT NULL,
	[about_me] [varchar](100) NULL,
	[profile_link] [varchar](100) NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Website]    Script Date: 28.05.2020 1:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Website](
	[id] [int] NOT NULL IDENTITY(1,1),
	[title] [varchar](50) NULL,
	[id_author] [int] NULL,
 CONSTRAINT [PK_Website] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User1] FOREIGN KEY([id_author])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User1]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Website] FOREIGN KEY([id_website])
REFERENCES [dbo].[Website] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Website]
GO
ALTER TABLE [dbo].[ContentBlock]  WITH CHECK ADD  CONSTRAINT [FK_ContentBlock_Website] FOREIGN KEY([id_website])
REFERENCES [dbo].[Website] ([id])
GO
ALTER TABLE [dbo].[ContentBlock] CHECK CONSTRAINT [FK_ContentBlock_Website]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_Follow_User] FOREIGN KEY([id_follower])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_Follow_User]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_Follow_User1] FOREIGN KEY([id_following])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_Follow_User1]
GO
ALTER TABLE [dbo].[PurchaseSettings]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseSettings_PurchasePlan] FOREIGN KEY([id_plan])
REFERENCES [dbo].[PurchasePlan] ([id])
GO
ALTER TABLE [dbo].[PurchaseSettings] CHECK CONSTRAINT [FK_PurchaseSettings_PurchasePlan]
GO
ALTER TABLE [dbo].[PurchaseSettings]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseSettings_User] FOREIGN KEY([id_user])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[PurchaseSettings] CHECK CONSTRAINT [FK_PurchaseSettings_User]
GO
ALTER TABLE [dbo].[SiteSettings]  WITH CHECK ADD  CONSTRAINT [FK_Website_SiteSettings] FOREIGN KEY([id_website])
REFERENCES [dbo].[Website] ([id])
GO

ALTER TABLE [dbo].[Website]  WITH CHECK ADD  CONSTRAINT [FK_Website_User] FOREIGN KEY([id_author])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Website] CHECK CONSTRAINT [FK_Website_User]
GO
