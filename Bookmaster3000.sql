/****** Object:  Database [Bookmaster3000]    Script Date: 12.08.2021 19:36:04 ******/
CREATE DATABASE [Bookmaster3000]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'S0', MAXSIZE = 250 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [Bookmaster3000] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [Bookmaster3000] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bookmaster3000] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bookmaster3000] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bookmaster3000] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bookmaster3000] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bookmaster3000] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bookmaster3000] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bookmaster3000] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bookmaster3000] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bookmaster3000] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bookmaster3000] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bookmaster3000] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bookmaster3000] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bookmaster3000] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [Bookmaster3000] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bookmaster3000] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Bookmaster3000] SET  MULTI_USER 
GO
ALTER DATABASE [Bookmaster3000] SET ENCRYPTION ON
GO
ALTER DATABASE [Bookmaster3000] SET QUERY_STORE = ON
GO
ALTER DATABASE [Bookmaster3000] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 12.08.2021 19:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Key] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Bio] [nvarchar](max) NULL,
	[BirthDate] [nvarchar](20) NULL,
	[DeathDate] [nvarchar](20) NULL,
	[Wikipedia] [nvarchar](255) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthors]    Script Date: 12.08.2021 19:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthors](
	[BookKey] [nvarchar](128) NOT NULL,
	[AuthorKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_BookAuthors] PRIMARY KEY CLUSTERED 
(
	[BookKey] ASC,
	[AuthorKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCovers]    Script Date: 12.08.2021 19:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCovers](
	[Id] [bigint] NOT NULL,
	[CoverFile] [int] NOT NULL,
	[Book_Key] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_BookCovers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 12.08.2021 19:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Key] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Subtitle] [nvarchar](500) NULL,
	[FirstPublishDate] [nvarchar](20) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookSubjects]    Script Date: 12.08.2021 19:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookSubjects](
	[Id] [bigint] NOT NULL,
	[Subject] [nvarchar](400) NOT NULL,
	[Book_Key] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_BookSubjects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12.08.2021 19:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [nchar](5) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[Zip] [nchar](10) NULL,
	[City] [nvarchar](50) NULL,
	[Phone] [nchar](12) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Issues]    Script Date: 12.08.2021 19:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issues](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BookID] [nvarchar](128) NOT NULL,
	[CustomerID] [nchar](5) NOT NULL,
	[DateOfIssue] [datetime] NOT NULL,
	[ReturnDate] [datetime] NULL,
	[Returned] [bit] NOT NULL,
 CONSTRAINT [PK_Issues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12.08.2021 19:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Authors] ([Key], [Name], [Bio], [BirthDate], [DeathDate], [Wikipedia]) VALUES (N'1', N'Роберт Льюис Стивенсон', N'Писатель, автор приключенческих романов', NULL, NULL, NULL)
INSERT [dbo].[Authors] ([Key], [Name], [Bio], [BirthDate], [DeathDate], [Wikipedia]) VALUES (N'2', N'Джоан Роулинг', N'Английская писательница', NULL, NULL, NULL)
INSERT [dbo].[Authors] ([Key], [Name], [Bio], [BirthDate], [DeathDate], [Wikipedia]) VALUES (N'3', N'Майн Рид', NULL, NULL, NULL, NULL)
INSERT [dbo].[Authors] ([Key], [Name], [Bio], [BirthDate], [DeathDate], [Wikipedia]) VALUES (N'4', N'Элис Сиболд', N'Alice Sibold', NULL, NULL, NULL)
INSERT [dbo].[Authors] ([Key], [Name], [Bio], [BirthDate], [DeathDate], [Wikipedia]) VALUES (N'5', N'Артут Конан Дойл', N'Писатель, доктор медицины', NULL, NULL, NULL)
GO
INSERT [dbo].[BookAuthors] ([BookKey], [AuthorKey]) VALUES (N'1', N'1')
INSERT [dbo].[BookAuthors] ([BookKey], [AuthorKey]) VALUES (N'1', N'2')
INSERT [dbo].[BookAuthors] ([BookKey], [AuthorKey]) VALUES (N'1', N'4')
INSERT [dbo].[BookAuthors] ([BookKey], [AuthorKey]) VALUES (N'1', N'5')
INSERT [dbo].[BookAuthors] ([BookKey], [AuthorKey]) VALUES (N'2', N'3')
INSERT [dbo].[BookAuthors] ([BookKey], [AuthorKey]) VALUES (N'3', N'1')
INSERT [dbo].[BookAuthors] ([BookKey], [AuthorKey]) VALUES (N'4', N'4')
INSERT [dbo].[BookAuthors] ([BookKey], [AuthorKey]) VALUES (N'5', N'5')
GO
INSERT [dbo].[Books] ([Key], [Title], [Subtitle], [FirstPublishDate], [Description]) VALUES (N'1', N'Приключения Шерлока Холмса', NULL, N'1889-8-12', N'')
INSERT [dbo].[Books] ([Key], [Title], [Subtitle], [FirstPublishDate], [Description]) VALUES (N'2', N'Гарри Поттер и философский камень', NULL, N'2001-6-11', N'??? ???????? ???????????! ??? ???????? ?????? ? ???????? (??? ??????) ? ?????? ??????? ?????? ?????? ???????????!

???? ??????: DS2021_??? ???????????(?????????)_??????????????? ????

? ?????? ??????: 

??? ??????????? (?????????), ???????, ??? ???????????? ? Tg, email, ????? ??????/????? ?????????

?????? ?? ?????? ????? ? ???????? ????? (??? ????????)  - ????? ?????? ?????? ???????????, ???????? ?? ?????, ????? ????? ???? ????????????? ??????????? ???????. ')
INSERT [dbo].[Books] ([Key], [Title], [Subtitle], [FirstPublishDate], [Description]) VALUES (N'3', N'Всадник без головы', NULL, NULL, N'Какое-то описание')
INSERT [dbo].[Books] ([Key], [Title], [Subtitle], [FirstPublishDate], [Description]) VALUES (N'4', N'Милые кости', NULL, NULL, N'?????????	 ????????	 ?	 ?????????	 ?????	 ??	 ????	 ??????,	 ??????????????	
???????	?	??	???????	??????.	
????????	 ?	 ??????	 ??????	 ????????????	 ?	 ????	 ??????,	 ????????????	
????????.
??????	???????	??????	????????	???	??????	?	?????????	???????????	??????	
?	?????	????.
????????	?????	????	?????????	???????.	???????????	???????	??????????,	
???????????	????????????	?????.
??????	??????	????????????	???????	?????.
?????????	 ?????	 ???????	 ???	 ????????	 ??????	 ?????	 ?????????	 ??	
???????????	???????????	??	Windows.
??????	 	?????????	 ????????????	 ???????	 ?	 ??????????	 ???	 ???????????	
???????????.
??????	 ??????	 ????	 ?????????,	 ????	 ??	 ??????????	
??????????/???????????	???????????')
INSERT [dbo].[Books] ([Key], [Title], [Subtitle], [FirstPublishDate], [Description]) VALUES (N'5', N'Остров сокровищ', NULL, NULL, N'ОписаниеОписаниеОписание')
INSERT [dbo].[Books] ([Key], [Title], [Subtitle], [FirstPublishDate], [Description]) VALUES (N'OL13716955W', N'Harry Potter and the Order of the Phoenix', NULL, NULL, NULL)
INSERT [dbo].[Books] ([Key], [Title], [Subtitle], [FirstPublishDate], [Description]) VALUES (N'OL14862437W', N'The homeplace', NULL, NULL, NULL)
INSERT [dbo].[Books] ([Key], [Title], [Subtitle], [FirstPublishDate], [Description]) VALUES (N'OL15175878W', N'Moby Dick, or The White Whale', NULL, NULL, NULL)
INSERT [dbo].[Books] ([Key], [Title], [Subtitle], [FirstPublishDate], [Description]) VALUES (N'OL15202028W', N'Les Misйrables', NULL, NULL, NULL)
INSERT [dbo].[Books] ([Key], [Title], [Subtitle], [FirstPublishDate], [Description]) VALUES (N'OL1793183W', N'Three Men in a Boat (to say nothing of the dog)', NULL, NULL, NULL)
INSERT [dbo].[Books] ([Key], [Title], [Subtitle], [FirstPublishDate], [Description]) VALUES (N'OL262758W', N'The Hobbit', NULL, NULL, NULL)
INSERT [dbo].[Books] ([Key], [Title], [Subtitle], [FirstPublishDate], [Description]) VALUES (N'OL5735363W', N'The Hunger Games', NULL, NULL, NULL)
INSERT [dbo].[Books] ([Key], [Title], [Subtitle], [FirstPublishDate], [Description]) VALUES (N'OL76837W', N'The Da Vinci Code', NULL, NULL, NULL)
GO
INSERT [dbo].[BookSubjects] ([Id], [Subject], [Book_Key]) VALUES (1, N'Субъект1', N'1')
INSERT [dbo].[BookSubjects] ([Id], [Subject], [Book_Key]) VALUES (2, N'Субъект2', N'1')
INSERT [dbo].[BookSubjects] ([Id], [Subject], [Book_Key]) VALUES (3, N'Субъект3', N'2')
INSERT [dbo].[BookSubjects] ([Id], [Subject], [Book_Key]) VALUES (4, N'Субъект44', N'4')
INSERT [dbo].[BookSubjects] ([Id], [Subject], [Book_Key]) VALUES (5, N'Субъект12', N'5')
INSERT [dbo].[BookSubjects] ([Id], [Subject], [Book_Key]) VALUES (6, N'Субъект4', N'3')
GO
INSERT [dbo].[Customers] ([ID], [Name], [Address], [Zip], [City], [Phone], [Email]) VALUES (N'C1005', N'Kenneth Wright', N'4070 Viverra.  Avenue', N'72604     ', N'Lac-Serent', N'202-555-0147', N'kwright@gmail.com')
INSERT [dbo].[Customers] ([ID], [Name], [Address], [Zip], [City], [Phone], [Email]) VALUES (N'C1006', N'Kylie Green', N'4196 Pharetra  Straße', N'8071      ', N'Northumberland', N'307-555-0125', N'kylie1990@msn.com')
INSERT [dbo].[Customers] ([ID], [Name], [Address], [Zip], [City], [Phone], [Email]) VALUES (N'C1013', N'Shelley Howard', N'5193 Aliquet Rd.', N'5404      ', N'Broxburn', N'410-555-0161', N'howardshelley@outlook.com')
INSERT [dbo].[Customers] ([ID], [Name], [Address], [Zip], [City], [Phone], [Email]) VALUES (N'C1017', N'Nash Charles', N'3549 Nullam  Rd.', N'487505    ', N'Turrialba', N'208-555-0115', N'nash_charles@yahoo.com')
INSERT [dbo].[Customers] ([ID], [Name], [Address], [Zip], [City], [Phone], [Email]) VALUES (N'C1021', N'Tad Curry', N'8702 Dolor.  Straße', N'52201     ', N'Carbonear', N'617-555-0184', N'tad80curry@gmail.com')
INSERT [dbo].[Customers] ([ID], [Name], [Address], [Zip], [City], [Phone], [Email]) VALUES (N'C1025', N'Quon Palm', N'7125 Aliquam  Straße', N'20248     ', N'Quimper', N'803-555-0173', N'palmer_quimper@msn.com')
INSERT [dbo].[Customers] ([ID], [Name], [Address], [Zip], [City], [Phone], [Email]) VALUES (N'C1027', N'Ulric Stein', N'2438 Ornare  Straße', N'9663      ', N'Río Hurtado', N'860-555-0157', N'stein7125@outlook.com')
INSERT [dbo].[Customers] ([ID], [Name], [Address], [Zip], [City], [Phone], [Email]) VALUES (N'C1028', N'Grace Bridges', N'243-9174 Semper St.', N'717993    ', N'Chaudfontaine', N'808-555-0116', N'grace.bridges@yahoo.com')
INSERT [dbo].[Customers] ([ID], [Name], [Address], [Zip], [City], [Phone], [Email]) VALUES (N'C1029', N'Jasper Sweet', N'564-8483 Cursus  Avenue', N'21300     ', N'York', N'601-555-0103', N'sweety_jasper@gmail.com')
INSERT [dbo].[Customers] ([ID], [Name], [Address], [Zip], [City], [Phone], [Email]) VALUES (N'C1030', N'Blair Glenn', N'457-157 Luctus  Rd.', N'644373    ', N'Vilna', N'405-555-0163', N'blair_glenn@msn.com')
INSERT [dbo].[Customers] ([ID], [Name], [Address], [Zip], [City], [Phone], [Email]) VALUES (N'C1031', N'Bianca Mendoza', N'2001 Sem St.', N'151099    ', N'Constitución', N'919-555-0122', N'bmendoza@outlook.com')
INSERT [dbo].[Customers] ([ID], [Name], [Address], [Zip], [City], [Phone], [Email]) VALUES (N'C1032', N'korkem', N'mustafina', N'777       ', N'Nur-Sultan', N'87785236243 ', N'zhardemova2012@mail.ru')
INSERT [dbo].[Customers] ([ID], [Name], [Address], [Zip], [City], [Phone], [Email]) VALUES (N'C1033', N'Assem', NULL, N'01000     ', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Issues] ON 

INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (1, N'OL262758W', N'C1028', CAST(N'2017-01-13T00:00:00.000' AS DateTime), CAST(N'2017-01-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (2, N'OL13716955W', N'C1028', CAST(N'2017-02-03T00:00:00.000' AS DateTime), CAST(N'2017-02-21T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (3, N'OL14862437W', N'C1029', CAST(N'2017-02-06T00:00:00.000' AS DateTime), CAST(N'2021-08-12T19:22:08.127' AS DateTime), 1)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (4, N'OL14862437W', N'C1017', CAST(N'2017-03-01T00:00:00.000' AS DateTime), CAST(N'2017-03-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (5, N'OL14862437W', N'C1031', CAST(N'2017-03-25T00:00:00.000' AS DateTime), CAST(N'2017-04-09T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (6, N'OL15202028W', N'C1028', CAST(N'2017-04-03T00:00:00.000' AS DateTime), CAST(N'2017-05-05T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (7, N'OL15175878W', N'C1029', CAST(N'2017-05-24T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (8, N'OL76837W', N'C1031', CAST(N'2017-05-25T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (9, N'OL14862437W', N'C1028', CAST(N'2017-05-26T00:00:00.000' AS DateTime), CAST(N'2017-06-16T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (10, N'OL1793183W', N'C1028', CAST(N'2017-05-26T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (11, N'OL15175878W', N'C1028', CAST(N'2017-06-03T00:00:00.000' AS DateTime), CAST(N'2017-06-11T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (12, N'OL76837W', N'C1028', CAST(N'2017-06-03T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (13, N'OL5735363W', N'C1028', CAST(N'2017-06-03T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (20, N'1', N'C1028', CAST(N'2021-08-12T18:34:53.383' AS DateTime), CAST(N'2021-08-12T18:43:20.833' AS DateTime), 1)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (21, N'2', N'C1028', CAST(N'2021-08-12T18:36:10.003' AS DateTime), CAST(N'2021-09-02T18:36:10.003' AS DateTime), 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (22, N'4', N'C1028', CAST(N'2021-08-12T18:47:17.723' AS DateTime), CAST(N'2021-09-02T18:47:17.723' AS DateTime), 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (23, N'3', N'C1028', CAST(N'2021-08-12T18:47:31.293' AS DateTime), CAST(N'2021-09-02T18:47:31.293' AS DateTime), 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (24, N'5', N'C1025', CAST(N'2021-08-12T18:47:51.263' AS DateTime), CAST(N'2021-09-02T18:47:51.263' AS DateTime), 0)
INSERT [dbo].[Issues] ([Id], [BookID], [CustomerID], [DateOfIssue], [ReturnDate], [Returned]) VALUES (25, N'2', N'C1031', CAST(N'2021-08-12T18:48:18.413' AS DateTime), CAST(N'2021-09-02T18:48:18.413' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Issues] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Username], [Password]) VALUES (1, N'administrator', N'admin123')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Issues] ADD  CONSTRAINT [DF_Issues_Returned]  DEFAULT ((0)) FOR [Returned]
GO
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthors_Authors] FOREIGN KEY([AuthorKey])
REFERENCES [dbo].[Authors] ([Key])
GO
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthors_Authors]
GO
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthors_Books] FOREIGN KEY([BookKey])
REFERENCES [dbo].[Books] ([Key])
GO
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthors_Books]
GO
ALTER TABLE [dbo].[BookCovers]  WITH CHECK ADD  CONSTRAINT [FK_BookCovers_Books] FOREIGN KEY([Book_Key])
REFERENCES [dbo].[Books] ([Key])
GO
ALTER TABLE [dbo].[BookCovers] CHECK CONSTRAINT [FK_BookCovers_Books]
GO
ALTER TABLE [dbo].[BookSubjects]  WITH CHECK ADD  CONSTRAINT [FK_BookSubjects_Books] FOREIGN KEY([Book_Key])
REFERENCES [dbo].[Books] ([Key])
GO
ALTER TABLE [dbo].[BookSubjects] CHECK CONSTRAINT [FK_BookSubjects_Books]
GO
ALTER TABLE [dbo].[Issues]  WITH CHECK ADD  CONSTRAINT [FK_Issues_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([Key])
GO
ALTER TABLE [dbo].[Issues] CHECK CONSTRAINT [FK_Issues_Books]
GO
ALTER TABLE [dbo].[Issues]  WITH CHECK ADD  CONSTRAINT [FK_Issues_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Issues] CHECK CONSTRAINT [FK_Issues_Customers]
GO
ALTER DATABASE [Bookmaster3000] SET  READ_WRITE 
GO
