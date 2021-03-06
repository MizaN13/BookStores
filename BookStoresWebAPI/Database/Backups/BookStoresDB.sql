USE [master]
GO
/****** Object:  Database [BookStoresDB]    Script Date: 2/2/2020 3:53:37 PM ******/
CREATE DATABASE [BookStoresDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pubs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\pubs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pubs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\pubs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BookStoresDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStoresDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStoresDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStoresDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStoresDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStoresDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStoresDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStoresDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookStoresDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStoresDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStoresDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStoresDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStoresDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStoresDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStoresDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStoresDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStoresDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStoresDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStoresDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStoresDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStoresDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStoresDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStoresDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStoresDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStoresDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStoresDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookStoresDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStoresDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStoresDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStoresDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStoresDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStoresDB] SET QUERY_STORE = OFF
GO
USE [BookStoresDB]
GO
/****** Object:  UserDefinedDataType [dbo].[empid]    Script Date: 2/2/2020 3:53:37 PM ******/
CREATE TYPE [dbo].[empid] FROM [char](9) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[id]    Script Date: 2/2/2020 3:53:37 PM ******/
CREATE TYPE [dbo].[id] FROM [varchar](11) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[tid]    Script Date: 2/2/2020 3:53:37 PM ******/
CREATE TYPE [dbo].[tid] FROM [varchar](6) NOT NULL
GO
/****** Object:  Table [dbo].[Author]    Script Date: 2/2/2020 3:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[author_id] [int] IDENTITY(1,1) NOT NULL,
	[last_name] [varchar](40) NOT NULL,
	[first_name] [varchar](20) NOT NULL,
	[phone] [char](12) NOT NULL,
	[address] [varchar](40) NULL,
	[city] [varchar](20) NULL,
	[state] [char](2) NULL,
	[zip] [char](5) NULL,
	[email_address] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 2/2/2020 3:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[book_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](80) NOT NULL,
	[type] [char](12) NOT NULL,
	[pub_id] [int] NOT NULL,
	[price] [money] NULL,
	[advance] [money] NULL,
	[royalty] [int] NULL,
	[ytd_sales] [int] NULL,
	[notes] [varchar](200) NULL,
	[published_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthor]    Script Date: 2/2/2020 3:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthor](
	[author_id] [int] NOT NULL,
	[book_id] [int] NOT NULL,
	[author_order] [tinyint] NULL,
	[royality_percentage] [int] NULL,
 CONSTRAINT [PK_BookAuthor] PRIMARY KEY CLUSTERED 
(
	[author_id] ASC,
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 2/2/2020 3:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[job_id] [smallint] IDENTITY(1,1) NOT NULL,
	[job_desc] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 2/2/2020 3:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[pub_id] [int] IDENTITY(1,1) NOT NULL,
	[publisher_name] [varchar](40) NULL,
	[city] [varchar](20) NULL,
	[state] [char](2) NULL,
	[country] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[pub_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 2/2/2020 3:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[token_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[token] [varchar](200) NOT NULL,
	[expiry_date] [datetime] NOT NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[token_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 2/2/2020 3:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[sale_id] [int] IDENTITY(1,1) NOT NULL,
	[store_id] [char](4) NOT NULL,
	[order_num] [varchar](20) NOT NULL,
	[order_date] [datetime] NOT NULL,
	[quantity] [smallint] NOT NULL,
	[pay_terms] [varchar](12) NOT NULL,
	[book_id] [int] NOT NULL,
 CONSTRAINT [PK_Sale2] PRIMARY KEY CLUSTERED 
(
	[sale_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 2/2/2020 3:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[store_id] [char](4) NOT NULL,
	[store_name] [varchar](40) NULL,
	[store_address] [varchar](40) NULL,
	[city] [varchar](20) NULL,
	[state] [char](2) NULL,
	[zip] [char](5) NULL,
 CONSTRAINT [UPK_storeid] PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/2/2020 3:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[email_address] [varchar](100) NULL,
	[password] [varchar](100) NULL,
	[first_name] [varchar](20) NOT NULL,
	[middle_name] [char](1) NULL,
	[last_name] [varchar](30) NOT NULL,
	[job_id] [smallint] NOT NULL,
	[job_level] [tinyint] NULL,
	[pub_id] [int] NOT NULL,
	[hire_date] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (1, N'Bennet', N'Abraham', N'415 658-9932', N'6223 Bateman St.', N'Berkeley', N'CA', N'94705', N'abraham.bennet@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (2, N'Stringer', N'Dirk', N'415 843-2991', N'5420 Telegraph Av.', N'Oakland', N'CA', N'94609', N'dirk.stringer@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (3, N'McBadden', N'Heather', N'707 448-4982', N'301 Putnam', N'Vacaville', N'CA', N'95688', N'heather.mcbadden@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (4, N'del Castillo', N'Innes', N'615 996-8275', N'2286 Cram Pl. #86', N'Ann Arbor', N'MI', N'48105', N'innes.del castillo@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (5, N'White', N'Johnson', N'408 496-7223', N'10932 Bigge Rd.', N'Menlo Park', N'CA', N'94025', N'johnson.white@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (6, N'Karsen', N'Livia', N'415 534-9219', N'5720 McAuley St.', N'Oakland', N'CA', N'94609', N'livia.karsen@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (7, N'Green', N'Marjorie', N'415 986-7020', N'309 63rd St. #411', N'Oakland', N'CA', N'94618', N'marjorie.green@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (8, N'Smith', N'Meander', N'913 843-0462', N'10 Mississippi Dr.', N'Lawrence', N'KS', N'66044', N'meander.smith@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (9, N'O''Leary', N'Michael', N'408 286-2428', N'22 Cleveland Av. #14', N'San Jose', N'CA', N'95128', N'michael.o''leary@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (10, N'DeFrance', N'Michel', N'219 547-9982', N'3 Balding Pl.', N'Gary', N'IN', N'46403', N'michel.defrance@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (11, N'Greene', N'Morningstar', N'615 297-2723', N'22 Graybar House Rd.', N'Nashville', N'TN', N'37215', N'morningstar.greene@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (12, N'Yokomoto', N'Akiko', N'415 935-4228', N'3 Silver Ct.', N'Walnut Creek', N'CA', N'94595', N'akiko.yokomoto@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (13, N'Blotchet-Halls', N'Reginald', N'503 745-6402', N'55 Hillsdale Bl.', N'Corvallis', N'OR', N'97330', N'reginald.blotchet-halls@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (14, N'Hunter', N'Sheryl', N'415 836-7128', N'3410 Blonde St.', N'Palo Alto', N'CA', N'94301', N'sheryl.hunter@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (15, N'MacFeather', N'Stearns', N'415 354-7128', N'44 Upland Hts.', N'Oakland', N'CA', N'94612', N'stearns.macfeather@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (16, N'Panteley', N'Sylvia', N'301 946-8853', N'1956 Arlington Pl.', N'Rockville', N'MD', N'20853', N'sylvia.panteley@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (17, N'Ringer', N'Albert', N'801 826-0752', N'67 Seventh Av.', N'Salt Lake City', N'UT', N'84152', N'albert.ringer@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (18, N'Dull', N'Ann', N'415 836-7128', N'3410 Blonde St.', N'Palo Alto', N'CA', N'94301', N'ann.dull@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (19, N'Ringer', N'Anne', N'801 826-0752', N'67 Seventh Av.', N'Salt Lake City', N'UT', N'84152', N'anne.ringer@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (20, N'Gringlesby', N'Burt', N'707 938-6445', N'PO Box 792', N'Covelo', N'CA', N'95428', N'burt.gringlesby@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (21, N'Locksley', N'Charlene', N'415 585-4620', N'18 Broadway Av.', N'San Francisco', N'CA', N'94130', N'charlene.locksley@gmail.com')
INSERT [dbo].[Author] ([author_id], [last_name], [first_name], [phone], [address], [city], [state], [zip], [email_address]) VALUES (22, N'Carson', N'Cheryl', N'415 548-7723', N'589 Darwin Ln.', N'Berkeley', N'CA', N'94705', N'cheryl.carson@gmail.com')
SET IDENTITY_INSERT [dbo].[Author] OFF
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (1, N'The Busy Executive''s Database Guide', N'business    ', 1, 19.9900, 5000.0000, 10, 4095, N'An overview of available database systems with emphasis on common business applications. Illustrated.', CAST(N'1991-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (2, N'Cooking with Computers: Surreptitious Balance Sheets', N'business    ', 1, 11.9500, 5000.0000, 10, 3876, N'Helpful hints on how to use your electronic resources to the best advantage.', CAST(N'1991-06-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (3, N'You Can Combat Computer Stress!', N'business    ', 2, 2.9900, 10125.0000, 24, 18722, N'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.', CAST(N'1991-06-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (4, N'Straight Talk About Computers', N'business    ', 2, 19.9900, 5000.0000, 10, 4095, N'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.', CAST(N'1991-06-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (5, N'Silicon Valley Gastronomic Treats', N'mod_cook    ', 2, 19.9900, 0.0000, 12, 2032, N'Favorite recipes for quick, easy, and elegant meals.', CAST(N'1991-06-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (6, N'The Gourmet Microwave', N'mod_cook    ', 2, 2.9900, 15000.0000, 24, 22246, N'Traditional French gourmet recipes adapted for modern microwave cooking.', CAST(N'1991-06-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (7, N'The Psychology of Computer Cooking', N'UNDECIDED   ', 3, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-10-08T09:43:33.670' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (8, N'But Is It User Friendly?', N'popular_comp', 4, 22.9500, 7000.0000, 16, 8780, N'A survey of software for the naive user, focusing on the ''friendliness'' of each.', CAST(N'1991-06-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (9, N'Secrets of Silicon Valley', N'popular_comp', 4, 20.0000, 8000.0000, 10, 4095, N'Muckraking reporting on the world''s largest computer hardware and software manufacturers.', CAST(N'1994-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (10, N'Net Etiquette', N'popular_comp', 4, NULL, NULL, NULL, NULL, N'A must-read for computer conferencing.', CAST(N'2019-10-08T09:43:33.670' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (11, N'Computer Phobic AND Non-Phobic Individuals: Behavior Variations', N'psychology  ', 5, 21.5900, 7000.0000, 10, 375, N'A must for the specialist, this book examines the difference between those who hate and fear computers and those who don''t.', CAST(N'1991-10-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (12, N'Is Anger the Enemy?', N'psychology  ', 6, 10.9500, 2275.0000, 12, 2045, N'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.', CAST(N'1991-06-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (13, N'Life Without Fear', N'psychology  ', 7, 7.0000, 6000.0000, 10, 111, N'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.', CAST(N'1991-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (14, N'Prolonged Data Deprivation: Four Case Studies', N'psychology  ', 7, 19.9900, 2000.0000, 10, 4072, N'What happens when the data runs dry?  Searching evaluations of information-shortage effects.', CAST(N'1991-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (15, N'Emotional Security: A New Algorithm', N'psychology  ', 7, 7.9900, 4000.0000, 10, 3336, N'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.', CAST(N'1991-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (16, N'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean', N'trad_cook   ', 8, 20.9500, 7000.0000, 10, 375, N'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.', CAST(N'1991-10-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (17, N'Fifty Years in Buckingham Palace Kitchens', N'trad_cook   ', 8, 11.9500, 4000.0000, 14, 15096, N'More anecdotes from the Queen''s favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.', CAST(N'1991-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([book_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [published_date]) VALUES (18, N'Sushi, Anyone?', N'trad_cook   ', 8, 14.9900, 8000.0000, 10, 4095, N'Detailed instructions on how to make authentic Japanese sushi in your spare time.', CAST(N'1991-06-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Book] OFF
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (4, 5, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (5, 14, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (6, 11, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (7, 1, 2, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (7, 3, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (9, 2, 2, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (9, 18, 2, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (10, 6, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (12, 18, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (13, 17, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (14, 9, 2, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (15, 2, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (15, 11, 2, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (16, 16, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (17, 12, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (17, 13, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (18, 9, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (19, 6, 2, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (19, 12, 2, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (20, 18, 3, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (21, 10, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (21, 15, 1, NULL)
INSERT [dbo].[BookAuthor] ([author_id], [book_id], [author_order], [royality_percentage]) VALUES (22, 8, 1, NULL)
SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (1, N'New Hire - Job not specified')
INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (2, N'Chief Executive Officer')
INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (3, N'Business Operations Manager')
INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (4, N'Chief Financial Officier')
INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (5, N'Publisher')
INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (6, N'Managing Editor')
INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (7, N'Marketing Manager')
INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (8, N'Public Relations Manager')
INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (9, N'Acquisitions Manager')
INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (10, N'Productions Manager')
INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (11, N'Operations Manager')
INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (12, N'Editor')
INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (13, N'Sales Representative')
INSERT [dbo].[Job] ([job_id], [job_desc]) VALUES (14, N'Designer')
SET IDENTITY_INSERT [dbo].[Job] OFF
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([pub_id], [publisher_name], [city], [state], [country]) VALUES (1, N'New Moon Books', N'Boston', N'MA', N'USA')
INSERT [dbo].[Publisher] ([pub_id], [publisher_name], [city], [state], [country]) VALUES (2, N'Binnet & Hardley', N'Washington', N'DC', N'USA')
INSERT [dbo].[Publisher] ([pub_id], [publisher_name], [city], [state], [country]) VALUES (3, N'Algodata Infosystems', N'Berkeley', N'CA', N'USA')
INSERT [dbo].[Publisher] ([pub_id], [publisher_name], [city], [state], [country]) VALUES (4, N'Five Lakes Publishing', N'Chicago', N'IL', N'USA')
INSERT [dbo].[Publisher] ([pub_id], [publisher_name], [city], [state], [country]) VALUES (5, N'Ramona Publishers', N'Dallas', N'TX', N'USA')
INSERT [dbo].[Publisher] ([pub_id], [publisher_name], [city], [state], [country]) VALUES (6, N'GGG&G', N'M?nchen', NULL, N'Germany')
INSERT [dbo].[Publisher] ([pub_id], [publisher_name], [city], [state], [country]) VALUES (7, N'Scootney Books', N'New York', N'NY', N'USA')
INSERT [dbo].[Publisher] ([pub_id], [publisher_name], [city], [state], [country]) VALUES (8, N'Lucerne Publishing', N'Paris', NULL, N'France')
SET IDENTITY_INSERT [dbo].[Publisher] OFF
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 

INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (1, 44, N'IKNELFYm0+Fsz9aK+vq5BftKRqZFEkxLf7RZ1qtbn7E=', CAST(N'2020-08-01T14:56:58.480' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (2, 44, N'AsSHV3yHj+Jo2007Aa1sizw7XZsmXOGYi3Ir8dLi9xc=', CAST(N'2020-08-01T17:03:01.197' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (3, 44, N'rQS6HSa0VhIaGjMPh7RnuygjJGqLCEVudjDhOPCv05M=', CAST(N'2020-08-01T17:13:17.863' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (4, 44, N'bVmg2+b3aAlp7/BEkYwNJHNCb2Z6BHX9BBwcHhahshs=', CAST(N'2020-08-01T20:34:25.517' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (5, 44, N'F3xHYQLqYdxjTv3jpjPRz1uNSMJ+tfT0kK1iZ715sxk=', CAST(N'2020-08-01T20:35:57.443' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (6, 44, N'atFNFc3EecWsQxHaKS/4XhxvBkPC/36g/APOzbzyW/k=', CAST(N'2020-08-01T20:36:50.623' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (7, 44, N'yfsZ/Dky//B2zZNWK3bWP8u8vHe+1iSvLJtmZK+HUtE=', CAST(N'2020-08-01T20:38:08.463' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (8, 44, N'28IxDMmdk/RNhO8F12yb40TV4qOpUT3Z+Kc5cGYUINw=', CAST(N'2020-08-01T20:39:56.153' AS DateTime))
INSERT [dbo].[RefreshToken] ([token_id], [user_id], [token], [expiry_date]) VALUES (9, 44, N'HiwkO/JEeEFsDFQo407i50npoVEFRImx/NP3aHFanps=', CAST(N'2020-08-01T20:49:46.363' AS DateTime))
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (1, N'6380', N'6871', CAST(N'1994-09-14T00:00:00.000' AS DateTime), 5, N'Net 60', 1)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (2, N'6380', N'722a', CAST(N'1994-09-13T00:00:00.000' AS DateTime), 3, N'Net 60', 12)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (3, N'7066', N'A2976', CAST(N'1993-05-24T00:00:00.000' AS DateTime), 50, N'Net 30', 9)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (4, N'7066', N'QA7442.3', CAST(N'1994-09-13T00:00:00.000' AS DateTime), 75, N'ON invoice', 12)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (5, N'7067', N'D4482', CAST(N'1994-09-14T00:00:00.000' AS DateTime), 10, N'Net 60', 12)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (6, N'7067', N'P2121', CAST(N'1992-06-15T00:00:00.000' AS DateTime), 40, N'Net 30', 16)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (7, N'7067', N'P2121', CAST(N'1992-06-15T00:00:00.000' AS DateTime), 20, N'Net 30', 17)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (8, N'7067', N'P2121', CAST(N'1992-06-15T00:00:00.000' AS DateTime), 20, N'Net 30', 18)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (9, N'7131', N'N914008', CAST(N'1994-09-14T00:00:00.000' AS DateTime), 20, N'Net 30', 12)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (10, N'7131', N'N914014', CAST(N'1994-09-14T00:00:00.000' AS DateTime), 25, N'Net 30', 6)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (11, N'7131', N'P3087a', CAST(N'1993-05-29T00:00:00.000' AS DateTime), 20, N'Net 60', 11)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (12, N'7131', N'P3087a', CAST(N'1993-05-29T00:00:00.000' AS DateTime), 25, N'Net 60', 13)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (13, N'7131', N'P3087a', CAST(N'1993-05-29T00:00:00.000' AS DateTime), 15, N'Net 60', 14)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (14, N'7131', N'P3087a', CAST(N'1993-05-29T00:00:00.000' AS DateTime), 25, N'Net 60', 15)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (15, N'7896', N'QQ2299', CAST(N'1993-10-28T00:00:00.000' AS DateTime), 15, N'Net 60', 4)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (16, N'7896', N'TQ456', CAST(N'1993-12-12T00:00:00.000' AS DateTime), 10, N'Net 60', 5)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (17, N'7896', N'X999', CAST(N'1993-02-21T00:00:00.000' AS DateTime), 35, N'ON invoice', 3)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (18, N'8042', N'423LL922', CAST(N'1994-09-14T00:00:00.000' AS DateTime), 15, N'ON invoice', 6)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (19, N'8042', N'423LL930', CAST(N'1994-09-14T00:00:00.000' AS DateTime), 10, N'ON invoice', 1)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (20, N'8042', N'P723', CAST(N'1993-03-11T00:00:00.000' AS DateTime), 25, N'Net 30', 2)
INSERT [dbo].[Sale] ([sale_id], [store_id], [order_num], [order_date], [quantity], [pay_terms], [book_id]) VALUES (21, N'8042', N'QA879.1', CAST(N'1993-05-22T00:00:00.000' AS DateTime), 30, N'Net 30', 8)
SET IDENTITY_INSERT [dbo].[Sale] OFF
INSERT [dbo].[Store] ([store_id], [store_name], [store_address], [city], [state], [zip]) VALUES (N'6380', N'Eric the Read Books', N'788 Catamaugus Ave.', N'Seattle', N'WA', N'98056')
INSERT [dbo].[Store] ([store_id], [store_name], [store_address], [city], [state], [zip]) VALUES (N'7066', N'Barnum''s', N'567 Pasadena Ave.', N'Tustin', N'CA', N'92789')
INSERT [dbo].[Store] ([store_id], [store_name], [store_address], [city], [state], [zip]) VALUES (N'7067', N'News & Brews', N'577 First St.', N'Los Gatos', N'CA', N'96745')
INSERT [dbo].[Store] ([store_id], [store_name], [store_address], [city], [state], [zip]) VALUES (N'7131', N'Doc-U-Mat: Quality Laundry and Books', N'24-A Avogadro Way', N'Remulade', N'WA', N'98014')
INSERT [dbo].[Store] ([store_id], [store_name], [store_address], [city], [state], [zip]) VALUES (N'7896', N'Fricative Bookshop', N'89 Madison St.', N'Fremont', N'CA', N'90019')
INSERT [dbo].[Store] ([store_id], [store_name], [store_address], [city], [state], [zip]) VALUES (N'8042', N'Bookbeat', N'679 Carson St.', N'Portland', N'OR', N'89076')
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (1, N'paolo.accorti@gmail.com', N'd58a7cfca32529d3f53ce8bdbf71bb0b', N'Paolo', N'M', N'Accorti', 13, 35, 2, CAST(N'1992-08-27T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (2, N'pedro.afonso@gmail.com', N'99680688bb6c5c55aa7704fa89994095', N'Pedro', N'S', N'Afonso', 14, 89, 3, CAST(N'1990-12-24T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (3, N'victoria.ashworth@gmail.com', N'f5542ce2319d45bf4582342d638550b8', N'Victoria', N'P', N'Ashworth', 6, 140, 2, CAST(N'1990-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (4, N'helen.bennett@gmail.com', N'e9d232a1852b692a7e9508c65b6171f7', N'Helen', N' ', N'Bennett', 12, 35, 2, CAST(N'1989-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (5, N'lesley.brown@gmail.com', N'97034cedc8690b3d70718a6d64967853', N'Lesley', N' ', N'Brown', 7, 120, 2, CAST(N'1991-02-13T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (6, N'francisco.chang@gmail.com', N'4daa15ca8dd722ded8dfef31b87b3233', N'Francisco', N' ', N'Chang', 4, 227, 7, CAST(N'1990-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (7, N'philip.cramer@gmail.com', N'33a7ce1b2f70fcbe4f7c2730d9885aab', N'Philip', N'T', N'Cramer', 2, 215, 7, CAST(N'1989-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (8, N'aria.cruz@gmail.com', N'2caea50eb5d005293d0a1746f0388cba', N'Aria', N' ', N'Cruz', 10, 87, 3, CAST(N'1991-10-26T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (9, N'ann.devon@gmail.com', N'234b4b2c43255c1e28d02e1f01e1ee23', N'Ann', N'M', N'Devon', 3, 200, 7, CAST(N'1991-07-16T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (10, N'anabela.domingues@gmail.com', N'054aeb2a3b1551828768bcdb1a0ecc74', N'Anabela', N'R', N'Domingues', 8, 100, 2, CAST(N'1993-01-27T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (11, N'peter.franken@gmail.com', N'e1ed3cb33f2f095867c915d25c8aee89', N'Peter', N'H', N'Franken', 10, 75, 2, CAST(N'1992-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (12, N'paul.henriot@gmail.com', N'd15e9e8be1cc996882eea7b67bc5d364', N'Paul', N'X', N'Henriot', 5, 159, 2, CAST(N'1993-08-19T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (13, N'carlos.hernadez@gmail.com', N'e26c377138dd65707e55711d5719210d', N'Carlos', N'F', N'Hernadez', 5, 211, 8, CAST(N'1989-04-21T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (14, N'palle.ibsen@gmail.com', N'11201f7c203af329c5dee673ec03ca37', N'Palle', N'D', N'Ibsen', 7, 195, 1, CAST(N'1993-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (15, N'karla.jablonski@gmail.com', N'68aaf122ba1446d333c5004e2641df57', N'Karla', N'J', N'Jablonski', 9, 170, 8, CAST(N'1994-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (16, N'karin.josephs@gmail.com', N'056bdfd398f36d86ed8fd9145af278f8', N'Karin', N'F', N'Josephs', 14, 100, 1, CAST(N'1992-10-17T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (17, N'matti.karttunen@gmail.com', N'119f79b2dc29583362ed6d03d8f5aa0f', N'Matti', N'G', N'Karttunen', 6, 220, 1, CAST(N'1994-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (18, N'pirkko.koskitalo@gmail.com', N'3d257bb8efeac632b4e662b614364ff0', N'Pirkko', N'O', N'Koskitalo', 10, 80, 8, CAST(N'1993-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (19, N'janine.labrune@gmail.com', N'03ecb265eb54ac869609f6a57d3aa7bb', N'Janine', N'Y', N'Labrune', 5, 172, 6, CAST(N'1991-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (20, N'maria.larsson@gmail.com', N'510e7119883fcb468e0a1fa1e99058ad', N'Maria', N' ', N'Larsson', 7, 135, 3, CAST(N'1992-03-27T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (21, N'yoshi.latimer@gmail.com', N'888d74a96e5ed2a4efa21bf067472fd1', N'Yoshi', N' ', N'Latimer', 12, 32, 3, CAST(N'1989-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (22, N'laurence.lebihan@gmail.com', N'cb944a302015a3c86c43639c4af2026e', N'Laurence', N'A', N'Lebihan', 5, 175, 1, CAST(N'1990-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (23, N'elizabeth.lincoln@gmail.com', N'e5c88db5d2234d599be77523eb7ab673', N'Elizabeth', N'N', N'Lincoln', 14, 35, 2, CAST(N'1990-07-24T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (24, N'patricia.mckenna@gmail.com', N'be0f9d4835cfc4de3dfcb2fc46f24b45', N'Patricia', N'C', N'McKenna', 11, 150, 8, CAST(N'1989-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (25, N'roland.mendel@gmail.com', N'7de8683294688271c520323ecf01b44b', N'Roland', N' ', N'Mendel', 11, 150, 1, CAST(N'1991-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (26, N'rita.muller@gmail.com', N'9412be5c9cdb4c3b4f5c03775fc495ab', N'Rita', N'B', N'Muller', 5, 198, 4, CAST(N'1993-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (27, N'helvetius.nagy@gmail.com', N'bfb106bd88053e860a99ee73b2239c86', N'Helvetius', N'A', N'Nagy', 7, 120, 8, CAST(N'1993-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (28, N'timothy.o''rourke@gmail.com', N'd069d253d23a4e2a76df5e5347444446', N'Timothy', N'P', N'O''Rourke', 13, 100, 1, CAST(N'1988-06-19T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (29, N'sven.ottlieb@gmail.com', N'89dd2a3836149f102826e5ea773d3265', N'Sven', N'K', N'Ottlieb', 5, 150, 3, CAST(N'1991-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (30, N'miguel.paolino@gmail.com', N'9f52fa84113b54c17ff3c2610ea9847b', N'Miguel', N'A', N'Paolino', 11, 112, 3, CAST(N'1992-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (31, N'paula.parente@gmail.com', N'c004780d86ce69ef12822167521e4fe2', N'Paula', N'S', N'Parente', 8, 125, 3, CAST(N'1994-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (32, N'manuel.pereira@gmail.com', N'c7ecd3c9c5ad1d70697c47c4fa435f57', N'Manuel', N' ', N'Pereira', 8, 101, 8, CAST(N'1989-01-09T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (33, N'maria.pontes@gmail.com', N'a0103b06f708acce6eabdeb2de09c6dc', N'Maria', N'J', N'Pontes', 5, 246, 5, CAST(N'1989-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (34, N'martine.rance@gmail.com', N'6affb38e556e039b12d05994475323cb', N'Martine', N' ', N'Rance', 9, 75, 2, CAST(N'1992-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (35, N'diego.roel@gmail.com', N'8d21a5250e2663f4ca84b7c526e680a5', N'Diego', N'W', N'Roel', 6, 192, 3, CAST(N'1991-12-16T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (36, N'annette.roulet@gmail.com', N'46bc7cb510e1be6f2bf1e44611f424ac', N'Annette', N' ', N'Roulet', 6, 152, 8, CAST(N'1990-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (37, N'mary.saveley@gmail.com', N'8b44843fcbb7c2ad1ab6e415473cb42f', N'Mary', N'M', N'Saveley', 8, 175, 1, CAST(N'1993-06-29T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (38, N'carine.schmitt@gmail.com', N'c9935fafb77671eb170adb8bfde3257f', N'Carine', N'G', N'Schmitt', 13, 64, 3, CAST(N'1992-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (39, N'margaret.smith@gmail.com', N'79cb518362503b10c4f8b0fae2dc055c', N'Margaret', N'A', N'Smith', 9, 78, 3, CAST(N'1988-09-29T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (40, N'howard.snyder@gmail.com', N'3b11f056c1d81d7835feaa7592148656', N'Howard', N'A', N'Snyder', 12, 100, 1, CAST(N'1988-11-19T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (41, N'martin.sommer@gmail.com', N'daed6b81dbbe4e29674198d08cdd9e22', N'Martin', N'F', N'Sommer', 10, 165, 1, CAST(N'1990-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (42, N'gary.thomas@gmail.com', N'2ab391bb9a0ef6e0c49aab21a7e296ea', N'Gary', N'H', N'Thomas', 9, 170, 1, CAST(N'1988-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (43, N'daniel.tonini@gmail.com', N'8d5d7d3510cb778173c99f91d76a413b', N'Daniel', N'B', N'Tonini', 11, 75, 2, CAST(N'1990-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([user_id], [email_address], [password], [first_name], [middle_name], [last_name], [job_id], [job_level], [pub_id], [hire_date]) VALUES (44, N'john.smith@gmail.com', N'8be7dbd7237e2e0bf90ff81b8ff44333', N'John', N'F', N'Smith', 14, 100, 8, CAST(N'2020-01-03T09:47:58.470' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Index [PK_user_id]    Script Date: 2/2/2020 3:53:37 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [PK_user_id] PRIMARY KEY NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Author] ADD  DEFAULT ('UNKNOWN') FOR [phone]
GO
ALTER TABLE [dbo].[Book] ADD  DEFAULT ('UNDECIDED') FOR [type]
GO
ALTER TABLE [dbo].[Book] ADD  DEFAULT (getdate()) FOR [published_date]
GO
ALTER TABLE [dbo].[Job] ADD  DEFAULT ('New Position - title not formalized yet') FOR [job_desc]
GO
ALTER TABLE [dbo].[Publisher] ADD  DEFAULT ('USA') FOR [country]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((1)) FOR [job_id]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((10)) FOR [job_level]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [hire_date]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([pub_id])
REFERENCES [dbo].[Publisher] ([pub_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD FOREIGN KEY([author_id])
REFERENCES [dbo].[Author] ([author_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD FOREIGN KEY([book_id])
REFERENCES [dbo].[Book] ([book_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([book_id])
REFERENCES [dbo].[Book] ([book_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [dbo].[Store] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([job_id])
REFERENCES [dbo].[Job] ([job_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([pub_id])
REFERENCES [dbo].[Publisher] ([pub_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Author]  WITH CHECK ADD CHECK  (([zip] like '[0-9][0-9][0-9][0-9][0-9]'))
GO
/****** Object:  StoredProcedure [dbo].[byroyalty]    Script Date: 2/2/2020 3:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[byroyalty] @percentage int
AS
select au_id from titleauthor
where titleauthor.royaltyper = @percentage

GO
/****** Object:  StoredProcedure [dbo].[reptq1]    Script Date: 2/2/2020 3:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[reptq1] AS
select 
	case when grouping(pub_id) = 1 then 'ALL' else pub_id end as pub_id, 
	avg(price) as avg_price
from titles
where price is NOT NULL
group by pub_id with rollup
order by pub_id

GO
/****** Object:  StoredProcedure [dbo].[reptq2]    Script Date: 2/2/2020 3:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[reptq2] AS
select 
	case when grouping(type) = 1 then 'ALL' else type end as type, 
	case when grouping(pub_id) = 1 then 'ALL' else pub_id end as pub_id, 
	avg(ytd_sales) as avg_ytd_sales
from titles
where pub_id is NOT NULL
group by pub_id, type with rollup

GO
/****** Object:  StoredProcedure [dbo].[reptq3]    Script Date: 2/2/2020 3:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[reptq3] @lolimit money, @hilimit money,
@type char(12)
AS
select 
	case when grouping(pub_id) = 1 then 'ALL' else pub_id end as pub_id, 
	case when grouping(type) = 1 then 'ALL' else type end as type, 
	count(title_id) as cnt
from titles
where price >@lolimit AND price <@hilimit AND type = @type OR type LIKE '%cook%'
group by pub_id, type with rollup

GO
USE [master]
GO
ALTER DATABASE [BookStoresDB] SET  READ_WRITE 
GO
