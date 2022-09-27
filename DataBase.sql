USE [master]
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'SWP391_SE1630_N3')
BEGIN
	ALTER DATABASE [SWP391_SE1630_N3] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [SWP391_SE1630_N3] SET ONLINE;
	DROP DATABASE [SWP391_SE1630_N3];
END
GO
CREATE DATABASE [SWP391_SE1630_N3]
GO
USE [SWP391_SE1630_N3]
GO
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(15) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 

/****** Object:  Table [dbo].[account]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](50) NULL,
	[gender] [int] NULL,
	[password] [varchar](50) NULL,
	[user] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](20) NULL,
	[image_id] [int] NULL,
	[address] [nvarchar](100) NULL,
	[role] [int] NULL,
	[create_at] [date] NULL,
	[updated_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[author_id] [int] NULL,
	[title] [varchar](100) NULL,
	[content] [nvarchar](300) NULL,
	[count_view] [int] NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[brandID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NULL,
	[detail] [varchar](100) NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[brandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NULL,
	[detail] [nvarchar](100) NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[rate_star] [int] NULL,
	[detail] [varchar](100) NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[imageSource] [varchar](150) NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image_blog]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image_blog](
	[blog_id] [int] NOT NULL,
	[image_id] [int] NOT NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
 CONSTRAINT [ib_id] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC,
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image_feedback]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image_feedback](
	[feedback_id] [int] NOT NULL,
	[image_id] [int] NOT NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
 CONSTRAINT [if_id] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC,
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image_product]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image_product](
	[product_id] [int] NOT NULL,
	[image_id] [int] NOT NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
 CONSTRAINT [ip_id] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[full_name] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](20) NULL,
	[address] [nvarchar](50) NULL,
	[note] [varchar](100) NULL,
	[status] [varchar](50) NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[feedback_id] [int] NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
 CONSTRAINT [od_id] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[description] [nvarchar](150) NULL,
	[size] [nvarchar](10) NULL,
	[categoryID] [int] NULL,
	[brandID] [int] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[sale] [int] NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_url]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_url](
	[id_role] [int] NOT NULL,
	[id_url] [int] NOT NULL,
 CONSTRAINT [ru_id] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC,
	[id_url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[url]    Script Date: 9/20/2022 10:23:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[url](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (1, N'Pham Quoc Hung', 1, N'hung12', N'phamquochung', N'quochung123@gmail.com', N'0387678969', 1, N'Doan Hung', 1, (N'2001-08-12'), (N'2022-08-12'))
INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (2, N'Vu Hoai Nam', 1, N'nam123', N'hoainam', N'hoainam2001@gmail.com', N'0123896456', 1, N'Cam Pha', 1, (N'1999-05-04'), (N'2022-05-04'))
INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (3, N'Nguyen Van Phuc', 1, N'phuc08', N'vanphuc', N'phuctolai@gmail.com', N'0124558894', 1, N'Trung Quoc', 2, (N'1999-12-25'), (N'2022-12-25'))
INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (4, N'Le Hoang Long', 1, N'longdeptrai', N'anhlongdoan', N'longdeptrai@gmail.com', N'0255569978', 1, N'Ha Noi', 2, (N'1996-05-14'), (N'2022-05-14'))
INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (5, N'Le Thanh Tung', 1, N'tungfifa', N'leetung', N'leetung@gmail.com', N'0366757039', 1, N'Ninh Binh', 3, (N'2001-12-31'), (N'2022-12-31'))
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([brandID], [title], [detail], [created_at], [update_at]) VALUES (1, N'fury', N'Favorite', (N'2020-07-12'), (N'2022-06-13'))
INSERT [dbo].[brand] ([brandID], [title], [detail], [created_at], [update_at]) VALUES (2, N'mit', N'Famous', (N'2020-09-24'), (N'2022-09-24'))
INSERT [dbo].[brand] ([brandID], [title], [detail], [created_at], [update_at]) VALUES (3, N'predator', N'Favoratie', (N'2020-11-12'), (N'2022-09-27'))
INSERT [dbo].[brand] ([brandID], [title], [detail], [created_at], [update_at]) VALUES (4, N'peri', N'Famous', (N'2020-01-12'), (N'2022-06-19'))
INSERT [dbo].[brand] ([brandID], [title], [detail], [created_at], [update_at]) VALUES (5, N'aramith', N'Favoratie', (N'2020-04-12'), (N'2022-02-13'))
INSERT [dbo].[brand] ([brandID], [title], [detail], [created_at], [update_at]) VALUES (6, N'diamond', N'Famous', (N'2020-10-12'), (N'2022-08-16'))
INSERT [dbo].[brand] ([brandID], [title], [detail], [created_at], [update_at]) VALUES (7, N'rasson', N'Favoratie', (N'2020-10-29'), (N'2022-04-30'))
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([categoryID], [title], [detail], [created_at], [update_at]) VALUES (1, N'Cues', N'Gậy để bắn', (N'2020-08-15'), (N'2022-12-08'))
INSERT [dbo].[category] ([categoryID], [title], [detail], [created_at], [update_at]) VALUES (2, N'Ball Sets', N'Bóng để bàn', (N'2020-07-14'), (N'2020-06-14'))
INSERT [dbo].[category] ([categoryID], [title], [detail], [created_at], [update_at]) VALUES (3, N'Tables', N'Bàn bi a', (N'2020-10-12'), (N'2020-09-03'))
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[image] ON 

INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (1, N'', N'', (N'1900-01-01'), (N'1900-01-01'))
SET IDENTITY_INSERT [dbo].[image] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (1, N'Fury AG-201', N'New', N'19', 1, 1, 10, 3000, 20, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (2, N'Fury CL-5', N'New', N'19.5', 1, 1, 10, 5500, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (3, N'Fury CW-1', N'New', N'19', 1, 1, 10, 3500, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (4, N'Fury ZF-2', N'New', N'19.5', 1, 1, 10, 4550, 25, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (5, N'Fury MS-6', N'New', N'19', 1, 1, 10, 5200, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (6, N'Predator Ikon4 5', N'New', N'19.5', 1, 3, 10, 32500, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (7, N'Predator 9K-3 Azurite', N'New', N'19', 1, 3, 10, 27000, 20, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (8, N'Predator Blak4 4', N'New', N'19.5', 1, 3, 10, 45000, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (9, N'Predator Air II Jump Cue With Sport', N'New', N'19', 1, 3, 10, 9000, 30, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (10, N'Predator Edition Roadline 12', N'New', N'19.5', 1, 3, 10, 13000, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (11, N'Peri VK-02', N'New', N'19', 1, 4, 10, 18100, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (12, N'Peri V30-01', N'New', N'19.5', 1, 4, 10, 38100, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (13, N'Peri Duke Dracula P-T01', N'New', N'19.5', 1, 4, 10, 125000, 25, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (14, N'Peri VS-02', N'New', N'19', 1, 4, 10, 9000, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (15, N'Peri P-S05', N'New', N'19.5', 1, 4, 10, 7000, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (16, N'Mit MC Limited', N'New', N'19', 1, 2, 20, 12650, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (17, N'Mit MC1-010', N'New', N'19.5', 1, 2, 20, 12350, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (18, N'Mit MO83-08', N'New', N'19', 1, 2, 20, 14050, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (19, N'Mit MH21-03', N'New', N'19.5', 1, 2, 20, 7840, 30, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (20, N'Mit MY22-3', N'New', N'19', 1, 2, 20, 7425, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (21, N'ARAMITH SUPER ARAMITH TOURNAMENT', N'New', N'3', 2, 5, 20, 4500, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (22, N'ARAMITH TOURNAMENT PRO-CUP TV', N'New', N'16', 2, 5, 20, 8000, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (23, N'ARAMITH SUPER PRO', N'New', N'16', 2, 5, 20, 10000, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (24, N'ARAMITH AMERICAN', N'New', N'22', 2, 5, 20, 12500, 35, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (25, N'ARAMITH TOURNAMENT BLACK', N'New', N'16', 2, 5, 20, 15000, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (26, N'RASSON OX 9FT', N'New', N'9', 3, 7, 25, 170000, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (27, N'DIAMOND PRO-AM 7FT ROSEWOOD', N'New', N'7', 3, 6, 15, 90000, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (28, N'DIAMOND PRO-AM 7FT CHARCOAL', N'New', N'7', 3, 6, 20, 85000, 20, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (29, N'DIAMOND PRO-AM 9FT CHARCOAL', N'New', N'9', 3, 6, 18, 110000, 0, (N'2022-09-15'), (N'2022-09-15'))
INSERT [dbo].[product] ([productID], [name], [description], [size], [categoryID], [brandID], [quantity], [price], [sale], [created_at], [update_at]) VALUES (30, N'RASSON VICTORY II 9FT', N'New', N'9', 3, 7, 15, 200000, 0, (N'2022-09-15'), (N'2022-09-15'))
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [role_name]) VALUES (1, N'admin')
INSERT [dbo].[role] ([id], [role_name]) VALUES (2, N'employee')
INSERT [dbo].[role] ([id], [role_name]) VALUES (3, N'customer')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 1)
GO
SET IDENTITY_INSERT [dbo].[url] ON 

INSERT [dbo].[url] ([id], [url]) VALUES (1, N'')
INSERT [dbo].[url] ([id], [url]) VALUES (2, N'')
INSERT [dbo].[url] ([id], [url]) VALUES (3, N'')
SET IDENTITY_INSERT [dbo].[url] OFF
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([image_id])
REFERENCES [dbo].[image] ([id])
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([role])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[blog]  WITH CHECK ADD FOREIGN KEY([author_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[image_blog]  WITH CHECK ADD FOREIGN KEY([blog_id])
REFERENCES [dbo].[blog] ([id])
GO
ALTER TABLE [dbo].[image_blog]  WITH CHECK ADD FOREIGN KEY([image_id])
REFERENCES [dbo].[image] ([id])
GO
ALTER TABLE [dbo].[image_feedback]  WITH CHECK ADD FOREIGN KEY([feedback_id])
REFERENCES [dbo].[feedback] ([id])
GO
ALTER TABLE [dbo].[image_feedback]  WITH CHECK ADD FOREIGN KEY([image_id])
REFERENCES [dbo].[image] ([id])
GO
ALTER TABLE [dbo].[image_product]  WITH CHECK ADD FOREIGN KEY([image_id])
REFERENCES [dbo].[image] ([id])
GO
ALTER TABLE [dbo].[image_product]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([feedback_id])
REFERENCES [dbo].[feedback] ([id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([brandID])
REFERENCES [dbo].[brand] ([brandID])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[category] ([categoryID])
GO
ALTER TABLE [dbo].[role_url]  WITH CHECK ADD FOREIGN KEY([id_role])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[role_url]  WITH CHECK ADD FOREIGN KEY([id_url])
REFERENCES [dbo].[url] ([id])
GO