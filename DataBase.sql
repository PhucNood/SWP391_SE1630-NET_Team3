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
	[updated_at] [date] NULL,
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
	[quantity] [int] NOT NULL,
	[feedback_id] [int] NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
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
	[des] varchar(50) NULL,
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
INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (2, N'Vu Hoai Nam', 1, N'admin', N'hoainam', N'admin@gmail.com', N'0123896456', 1, N'Cam Pha', 1, (N'1999-05-04'), (N'2022-05-04'))
INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (3, N'Nguyen Van "+search+"', 1, N'customer', N'van"+search+"', N'customer@gmail.com', N'0124558894', 1, N'Trung Quoc', 3, (N'1999-12-25'), (N'2022-12-25'))
INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (4, N'Le Hoang Long', 1, N'longdeptrai', N'anhlongdoan', N'longdeptrai@gmail.com', N'0255569978', 1, N'Ha Noi', 2, (N'1996-05-14'), (N'2022-05-14'))
INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (5, N'Le Thanh Tung', 1, N'tungfifa', N'leetung', N'leetung@gmail.com', N'0366757039', 1, N'Ninh Binh', 3, (N'2001-12-31'), (N'2022-12-31'))
INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (6, N'Le Xuan Sang', 1, N'sangle12', N'sangsang', N'sangle@gmail.com', N'0325125698', 1, N'Vinh "+search+"', 3, (N'2001-05-25'), (N'2022-05-25'))
INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (7, N'Le Mai Hoa', 0, N'Hoahoa1235', N'lehoa', N'lehoa@gmail.com', N'0145258789', 1, N'Hai Phong', 3, (N'1996-11-20'), (N'2022-12-20'))
INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (8, N'Hoang Xuan Thuy', 0, N'Xuanthuy777', N'xuanthuyy', N'xuanthuy@gmail.com', N'0365789123', 1, N'Bac Ninh', 3, (N'1999-04-26'), (N'2022-04-26'))
INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (9, N'Nguyen Linh Chi', 0, N'Linhlinh1', N'LinhChi', N'linhchi@gmail.com', N'0147852368', 1, N'Ninh Binh', 3, (N'2000-12-08'), (N'2022-04-25'))
INSERT [dbo].[account] ([id], [full_name], [gender], [password], [user], [email], [phone], [image_id], [address], [role], [create_at], [updated_at]) VALUES (10, N'Ha Lan', 0, N'Halanhalan', N'HaLanBay', N'halan@gmail.com', N'0225892564', 1, N'Ha Lan', 3, (N'2000-12-17'), (N'2022-12-17'))
SET IDENTITY_INSERT [dbo].[account] OFF
GO


INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (1, 1, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (2, 2, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (3, 3, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (4, 4, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (5, 5, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (6, 6, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (7, 7, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (8, 8, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (9, 9, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (10, 10, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (11, 11, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (12, 12, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (13, 13, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (14, 14, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (15, 15, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (16, 16, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (17, 17, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (18, 18, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (19, 19, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (20, 20, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (21, 21, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (22, 22, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (23, 23, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (24, 24, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (25, 25, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (26, 26, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (27, 27, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (28, 28, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (29, 29, (N'2022-08-12'), (N'2022-08-12'))
INSERT [dbo].[image_product] ([product_id], [image_id] ,[created_at], [updated_at]) VALUES (30, 30, (N'2022-08-12'), (N'2022-08-12'))

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

INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (1, N'Fury AG-201', N'AG-201.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (2, N'Fury CL-5', N'CL-5.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (3, N'Fury CW-1', N'CW-1.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (4, N'Fury ZF-2', N'ZF-2.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (5, N'Fury MS-6', N'MS-6.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (6, N'Predator Ikon4 5', N'pre6.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (7, N'Predator 9K-3 Azurite', N'pre7.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (8, N'Predator Blak4 4', N'pre8.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (9, N'Predator Air II Jump Cue With Sport', N'pre9.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (10, N'Predator Edition Roadline 12', N'pre10.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (11, N'Peri VK-02', N'peri11.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (12, N'Peri V30-01', N'peri12.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (13, N'Peri Duke Dracula P-T01', N'peri13.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (14, N'Peri VS-02', N'peri14.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (15, N'Peri P-S05', N'peri15.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (16, N'Mit MC Limited', N'mit16.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (17, N'Mit MC1-010', N'mit17.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (18, N'Mit MO83-08', N'mit18.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (19, N'Mit MH21-03', N'mit19.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (20, N'Mit MY22-3', N'mit20.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (21, N'ARAMITH SUPER ARAMITH TOURNAMENT', N'ball25.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (22, N'ARAMITH TOURNAMENT PRO-CUP TV', N'ball22.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (23, N'ARAMITH SUPER PRO', N'ball23.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (24, N'ARAMITH AMERICAN', N'ball24.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (25, N'ARAMITH TOURNAMENT BLACK', N'ball21.jpg', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (26, N'RASSON OX 9FT', N'table26.png', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (27, N'DIAMOND PRO-AM 7FT ROSEWOOD', N'table30.png', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (28, N'DIAMOND PRO-AM 7FT CHARCOAL', N'table28.png', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (29, N'DIAMOND PRO-AM 9FT CHARCOAL', N'table29.png', (N'2022-01-01'), (N'2020-01-01'))
INSERT [dbo].[image] ([id], [name], [imageSource], [created_at], [update_at]) VALUES (30, N'RASSON VICTORY II 9FT', N'table27.png', (N'2022-01-01'), (N'2020-01-01'))

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
INSERT [dbo].[role] ([id], [role_name]) VALUES (0, N'Guest')
INSERT [dbo].[role] ([id], [role_name]) VALUES (1, N'admin')
INSERT [dbo].[role] ([id], [role_name]) VALUES (2, N'employee')
INSERT [dbo].[role] ([id], [role_name]) VALUES (3, N'customer')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[url] ON 

INSERT [dbo].[url] ([id], [url]) VALUES (1, N'shop')
INSERT [dbo].[url] ([id], [url]) VALUES (2, N'home')
INSERT [dbo].[url] ([id], [url]) VALUES (3, N'search')
INSERT [dbo].[url] ([id], [url]) VALUES (4, N'blogList')
INSERT [dbo].[url] ([id], [url]) VALUES (5, N'signup')
INSERT [dbo].[url] ([id], [url]) VALUES (6, N'signout')
INSERT [dbo].[url] ([id], [url]) VALUES (7, N'productdetail')
INSERT [dbo].[url] ([id], [url]) VALUES (8, N'login')
INSERT [dbo].[url] ([id], [url]) VALUES (9, N'manageProduct')
INSERT [dbo].[url] ([id], [url]) VALUES (10, N'deleteProduct')
INSERT [dbo].[url] ([id], [url]) VALUES (11, N'editProduct')
INSERT [dbo].[url] ([id], [url]) VALUES (12, N'addProductImage')
INSERT [dbo].[url] ([id], [url]) VALUES (13, N'addProduct')
INSERT [dbo].[url] ([id], [url]) VALUES (14, N'deleteProductImage')
INSERT [dbo].[url] ([id], [url]) VALUES (15, N'saveAddImage')
INSERT [dbo].[url] ([id], [url]) VALUES (16, N'searchInManage')
INSERT [dbo].[url] ([id], [url]) VALUES (17, N'manageAccount')
INSERT [dbo].[url] ([id], [url]) VALUES (18, N'editAccountRole')
INSERT [dbo].[url] ([id], [url]) VALUES (19, N'changepass')
INSERT [dbo].[url] ([id], [url]) VALUES (20, N'information')
INSERT [dbo].[url] ([id], [url]) VALUES (21, N'changeinfo')
INSERT [dbo].[url] ([id], [url]) VALUES (22, N'about')
INSERT [dbo].[url] ([id], [url]) VALUES (23, N'contact')
INSERT [dbo].[url] ([id], [url]) VALUES (24, N'BlogDetail')
INSERT [dbo].[url] ([id], [url]) VALUES (25, N'ManageBlog')
INSERT [dbo].[url] ([id], [url]) VALUES (26, N'addToCart')
INSERT [dbo].[url] ([id], [url]) VALUES (27, N'showCart')
INSERT [dbo].[url] ([id], [url]) VALUES (28, N'updown')
INSERT [dbo].[url] ([id], [url]) VALUES (29, N'inputQuantityInCart')
INSERT [dbo].[url] ([id], [url]) VALUES (30, N'checkout')
INSERT [dbo].[url] ([id], [url]) VALUES (31, N'addOrder')
SET IDENTITY_INSERT [dbo].[url] OFF
GO

INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (0, 1)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (0, 2)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (0, 4)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (0, 5)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (0, 6)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (0, 8)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (0, 22)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (0, 23)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 3)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 7)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 9)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 10)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 11)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 12)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 13)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 14)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 15)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 16)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 17)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 18)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 19)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 20)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 21)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 24)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 25)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 26)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 27)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 28)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 29)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 30)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (1, 31)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 3)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 7)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 9)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 10)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 11)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 12)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 13)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 14)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 15)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 16)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 19)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 20)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 21)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 24)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 25)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 26)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 27)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 28)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 29)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 30)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (2, 31)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (3, 3)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (3, 7)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (3, 19)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (3, 20)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (3, 21)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (3, 24)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (3, 26)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (3, 27)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (3, 28)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (3, 29)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (3, 30)
INSERT [dbo].[role_url] ([id_role], [id_url]) VALUES (3, 31)
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
SET IDENTITY_INSERT [dbo].[blog] ON 
INSERT INTO blog([id],[author_id],[title],[content],[count_view],[created_at],[update_at]) 
VALUES(1,4,N'The verry first title of the blog'
,'The first blog ever write on this page in order to test the out put and how it gonna display. so this sentence not need to be that long just need to be long enoft to test and some how make this look like a paragrap'
,0,GETDATE(),GETDATE()
)
INSERT INTO blog([id],[author_id],[title],[content],[count_view],[created_at],[update_at]) 
VALUES(2,3,N'The title of the blog 2'
,'The blog has been create on this page in order to test the out put and how it gonna display. so this sentence not need to be that long just need to be long enoft to test and some how make this look like a paragrap'
,0,GETDATE(),GETDATE()
)
INSERT INTO blog([id],[author_id],[title],[content],[count_view],[created_at],[update_at]) 
VALUES(3,2,N'8 Inspiring Ways to Hit Ball in the Winter'
,'The blog has been create on this page in order to test the out put and how it gonna display. so this sentence not need to be that long just need to be long enoft to test and some how make this look like a paragrap'
,0,GETDATE(),GETDATE()
)
INSERT INTO blog([id],[author_id],[title],[content],[count_view],[created_at],[update_at]) 
VALUES(4,1,N'8 ball pool Game Is the shame of Billar'
,'The blog has been create on this page in order to test the out put and how it gonna display. so this sentence not need to be that long just need to be long enoft to test and some how make this look like a paragrap'
,0,GETDATE(),GETDATE()
)
INSERT INTO blog([id],[author_id],[title],[content],[count_view],[created_at],[update_at]) 
VALUES(5,4,N'8 ball pool in 8 diffrent pool'
,'The blog has been create on this page in order to test the out put and how it gonna display. so this sentence not need to be that long just need to be long enoft to test and some how make this look like a paragrap'
,0,GETDATE(),GETDATE()
)
INSERT INTO blog([id],[author_id],[title],[content],[count_view],[created_at],[update_at]) 
VALUES(6,3,N'8 ball pool torament'
,'The blog has been create on this page in order to test the out put and how it gonna display. so this sentence not need to be that long just need to be long enoft to test and some how make this look like a paragrap'
,0,GETDATE(),GETDATE()
)
INSERT INTO blog([id],[author_id],[title],[content],[count_view],[created_at],[update_at]) 
VALUES(7,2,N'The ball club create new torament base on 8 ball pool torament'
,'The blog has been create on this page in order to test the out put and how it gonna display. so this sentence not need to be that long just need to be long enoft to test and some how make this look like a paragrap'
,0,(N'2022-07-15'), (N'2022-07-15')
)
INSERT INTO blog([id],[author_id],[title],[content],[count_view],[created_at],[update_at]) 
VALUES(8,1,N'The title of the blog 8'
,'The blog has been create on this page in order to test the out put and how it gonna display. so this sentence not need to be that long just need to be long enoft to test and some how make this look like a paragrap'
,0,(N'2022-08-15'), (N'2022-08-15')
)
INSERT INTO blog([id],[author_id],[title],[content],[count_view],[created_at],[update_at]) 
VALUES(9,4,N'The title of the blog 9'
,'The blog has been create on this page in order to test the out put and how it gonna display. so this sentence not need to be that long just need to be long enoft to test and some how make this look like a paragrap'
,0,(N'2022-09-15'), (N'2022-09-15')
)
INSERT INTO blog([id],[author_id],[title],[content],[count_view],[created_at],[update_at]) 
VALUES(10,4,N'The title of the blog 9'
,'The blog has been create on this page in order to test the out put and how it gonna display. so this sentence not need to be that long just need to be long enoft to test and some how make this look like a paragrap'
,0,(N'2022-09-10'), (N'2022-09-10')
)
SET IDENTITY_INSERT [dbo].[blog] OFF 
GO
INSERT INTO image_blog VALUES (1,15)
INSERT INTO image_blog VALUES (1,16)
INSERT INTO image_blog VALUES (1,17)
INSERT INTO image_blog VALUES (2,15)
INSERT INTO image_blog VALUES (2,13)
INSERT INTO image_blog VALUES (3,15)
INSERT INTO image_blog VALUES (4,15)
INSERT INTO image_blog VALUES (5,15)
INSERT INTO image_blog VALUES (6,15)
INSERT INTO image_blog VALUES (7,15)
INSERT INTO image_blog VALUES (8,15)
INSERT INTO image_blog VALUES (9,15)
INSERT INTO image_blog VALUES (10,13)
GO
