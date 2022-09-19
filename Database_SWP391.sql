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
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [role](
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[role_name] [varchar](10),
)

CREATE TABLE [url](
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[url] [varchar](100),
)

CREATE TABLE [role_url](
	[id_role] [int] foreign key references [role]([id]),
	[id_url] [int] foreign key references [url]([id]),
	CONSTRAINT ru_id PRIMARY KEY ([id_role], [id_url])
)

CREATE TABLE account(
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[full_name] [nvarchar](50) ,
	[gender] int ,
	[password] [varchar](50),
	[user] [varchar](50),
	[email] [varchar](50),
	[phone] [varchar](20),
	[image] [varchar](100),
	[address] [nvarchar](100),
	[is_active] [bit] ,
	[code_active] [varchar](50),
	[code_forgot_password] [varchar](50),
	[exp_code_forgot_password] [datetime],
	[role] [int] foreign key references [role]([id]) ,
	[create_at] [datetime] ,
	[updated] [datetime] 

)

CREATE TABLE [image](
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[name] [nvarchar](50),
	[imageSource] [varchar](150),
	[created_at] [datetime],
	[update_at] [datetime],
)

CREATE TABLE blog(
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[author_id] [int] foreign key references account([id]),
	[title] [varchar](100) ,
	[content] [nvarchar](300),
	[count_view] [int], 
	[created_at] [datetime] ,
	[update_at] [datetime],
)

CREATE TABLE image_blog(
	[blog_id] [int] foreign key references blog([id]),
	[image_id] [int] foreign key references [image]([id]),
	[created_at] [datetime],
	[update_at] [datetime],
	CONSTRAINT ib_id PRIMARY KEY ([blog_id], [image_id])
)

CREATE TABLE slider(
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[title] [varchar](100) ,
	[backlink] [varchar](100) ,
	[note] [varchar](100) ,
	[status] [varchar](100), 
	[modifiled_by] [int] foreign key references account([id]) ,
	[created_at] [datetime],
	[update_at] [datetime],
)

CREATE TABLE image_slider(
	[slider_id] [int] foreign key references slider([id]),
	[image_id] [int] foreign key references [image]([id]),
	[created_at] [datetime],
	[update_at] [datetime],
	CONSTRAINT is_id PRIMARY KEY ([slider_id], [image_id])
)

CREATE TABLE [order](
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[account_id] [int] foreign key references account([id]),
	[full_name] [nvarchar](50) ,
	[email] [varchar](50) ,
	[phone] [varchar](20) ,
	[address] [nvarchar](50), 
	[note] [varchar](100) ,
	[status] [varchar](50),
	[created_at] [datetime],
	[update_at] [datetime],
)
CREATE TABLE category(
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[title] [varchar](100),
	[detail] [varchar](100),
	[created_at] [datetime],
	[update_at] [datetime],
)

CREATE TABLE brand(
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[title] [varchar](100),
	[detail] [varchar](100),
	[created_at] [datetime],
	[update_at] [datetime],
)

CREATE TABLE product(
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[title] [varchar](100),
	[original_price] [float] ,
	[category_id] [int] foreign key references category([id]),
	[brand_id] [int] foreign key references brand([id]),
	[sale_price] [float] ,
	[detail] [varchar](100),
	[created_at] [datetime],
	[update_at] [datetime],
)

CREATE TABLE image_product(
	[product_id] [int] foreign key references product([id]),
	[image_id] [int] foreign key references [image]([id]),
	[created_at] [datetime],
	[update_at] [datetime],
	CONSTRAINT ip_id PRIMARY KEY ([product_id], [image_id])
)

CREATE TABLE feedback(
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[account_id] [int] foreign key references account([id]),
	[rate_star] [int] ,
	[detail] [varchar](100),
	[created_at] [datetime],
	[update_at] [datetime],
)

CREATE TABLE order_detail(
	[order_id] [int] foreign key references [order]([id]),
	[product_id] [int] foreign key references product([id]),
	[feedback_id] [int] foreign key references feedback([id]),
	[created_at] [datetime],
	[update_at] [datetime],
	CONSTRAINT od_id PRIMARY KEY ([order_id], [product_id])
)

CREATE TABLE image_feedback(
	[feedback_id] [int] foreign key references feedback([id]),
	[image_id] [int] foreign key references [image]([id]),
	[created_at] [datetime],
	[update_at] [datetime],
	CONSTRAINT if_id PRIMARY KEY ([feedback_id], [image_id])
)





