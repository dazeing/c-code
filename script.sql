USE [PTL]
GO
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT [FK_Ticket_Ride]
GO
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT [FK_Ticket_Person]
GO
ALTER TABLE [dbo].[Stop] DROP CONSTRAINT [FK_Stop_City]
GO
ALTER TABLE [dbo].[RouteStop] DROP CONSTRAINT [FK_RouteStop_Stop]
GO
ALTER TABLE [dbo].[RouteStop] DROP CONSTRAINT [FK_RouteStop_Route]
GO
ALTER TABLE [dbo].[RideStop] DROP CONSTRAINT [FK_RideStop_RouteStop]
GO
ALTER TABLE [dbo].[RideStop] DROP CONSTRAINT [FK_RideStop_Ride]
GO
ALTER TABLE [dbo].[Ride] DROP CONSTRAINT [FK_Ride_Vehicle]
GO
ALTER TABLE [dbo].[Ride] DROP CONSTRAINT [FK_Ride_Route]
GO
ALTER TABLE [dbo].[Region] DROP CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[Person] DROP CONSTRAINT [FK_Person_User]
GO
ALTER TABLE [dbo].[Person] DROP CONSTRAINT [FK_Person_Country]
GO
ALTER TABLE [dbo].[City] DROP CONSTRAINT [FK_City_Region]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 31.01.2020 12:05:57 ******/
DROP TABLE [dbo].[Vehicle]
GO
/****** Object:  Table [dbo].[User]    Script Date: 31.01.2020 12:05:57 ******/
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 31.01.2020 12:05:57 ******/
DROP TABLE [dbo].[Ticket]
GO
/****** Object:  Table [dbo].[Stop]    Script Date: 31.01.2020 12:05:57 ******/
DROP TABLE [dbo].[Stop]
GO
/****** Object:  Table [dbo].[RouteStop]    Script Date: 31.01.2020 12:05:57 ******/
DROP TABLE [dbo].[RouteStop]
GO
/****** Object:  Table [dbo].[Route]    Script Date: 31.01.2020 12:05:57 ******/
DROP TABLE [dbo].[Route]
GO
/****** Object:  Table [dbo].[RideStop]    Script Date: 31.01.2020 12:05:57 ******/
DROP TABLE [dbo].[RideStop]
GO
/****** Object:  Table [dbo].[Ride]    Script Date: 31.01.2020 12:05:57 ******/
DROP TABLE [dbo].[Ride]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 31.01.2020 12:05:57 ******/
DROP TABLE [dbo].[Region]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 31.01.2020 12:05:57 ******/
DROP TABLE [dbo].[Person]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 31.01.2020 12:05:57 ******/
DROP TABLE [dbo].[Country]
GO
/****** Object:  Table [dbo].[City]    Script Date: 31.01.2020 12:05:57 ******/
DROP TABLE [dbo].[City]
GO
USE [master]
GO
/****** Object:  Database [PTL]    Script Date: 31.01.2020 12:05:57 ******/
DROP DATABASE [PTL]
GO
/****** Object:  Database [PTL]    Script Date: 31.01.2020 12:05:57 ******/
CREATE DATABASE [PTL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PTL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PTL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PTL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PTL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PTL] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PTL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PTL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PTL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PTL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PTL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PTL] SET ARITHABORT OFF 
GO
ALTER DATABASE [PTL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PTL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PTL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PTL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PTL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PTL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PTL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PTL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PTL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PTL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PTL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PTL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PTL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PTL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PTL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PTL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PTL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PTL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PTL] SET  MULTI_USER 
GO
ALTER DATABASE [PTL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PTL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PTL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PTL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PTL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PTL] SET QUERY_STORE = OFF
GO
USE [PTL]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PTL]
GO
/****** Object:  Table [dbo].[City]    Script Date: 31.01.2020 12:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[City_Id] [int] IDENTITY(1,1) NOT NULL,
	[Region_Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[City_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 31.01.2020 12:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Country_Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Country_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 31.01.2020 12:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Person_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Country_Id] [int] NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[IsPrimary] [int] NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[PassportNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 31.01.2020 12:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Region_Id] [int] IDENTITY(1,1) NOT NULL,
	[Country_Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[Region_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ride]    Script Date: 31.01.2020 12:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ride](
	[Ride_Id] [int] IDENTITY(1,1) NOT NULL,
	[Route_Id] [int] NOT NULL,
	[Vehicle_Id] [int] NOT NULL,
	[Price] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ride] PRIMARY KEY CLUSTERED 
(
	[Ride_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RideStop]    Script Date: 31.01.2020 12:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RideStop](
	[RideStop_Id] [int] IDENTITY(1,1) NOT NULL,
	[Ride_Id] [int] NOT NULL,
	[RouteStop_Id] [int] NOT NULL,
	[DateTime_Departure] [datetime] NULL,
	[DateTime_Arrival] [datetime] NULL,
 CONSTRAINT [PK_RideStop] PRIMARY KEY CLUSTERED 
(
	[RideStop_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route]    Script Date: 31.01.2020 12:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[Route_Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[Route_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteStop]    Script Date: 31.01.2020 12:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteStop](
	[RouteStop_Id] [int] IDENTITY(1,1) NOT NULL,
	[Route_Id] [int] NOT NULL,
	[Stop_Id] [int] NOT NULL,
	[Position] [int] NOT NULL,
 CONSTRAINT [PK_RouteStop] PRIMARY KEY CLUSTERED 
(
	[RouteStop_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stop]    Script Date: 31.01.2020 12:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stop](
	[Stop_Id] [int] IDENTITY(1,1) NOT NULL,
	[City_Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Stop] PRIMARY KEY CLUSTERED 
(
	[Stop_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 31.01.2020 12:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Ticket_Id] [int] IDENTITY(1,1) NOT NULL,
	[Person_Id] [int] NOT NULL,
	[Ride_Id] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Ticket_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 31.01.2020 12:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](64) NOT NULL,
	[IsAdmin] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 31.01.2020 12:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[Vehicle_Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
	[PlateNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Vehicle_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([City_Id], [Region_Id], [Title]) VALUES (1, 1, N'Антополь')
INSERT [dbo].[City] ([City_Id], [Region_Id], [Title]) VALUES (2, 1, N'Барановичи')
INSERT [dbo].[City] ([City_Id], [Region_Id], [Title]) VALUES (4, 1, N'Береза')
INSERT [dbo].[City] ([City_Id], [Region_Id], [Title]) VALUES (5, 2, N'Барань')
INSERT [dbo].[City] ([City_Id], [Region_Id], [Title]) VALUES (6, 2, N'Бегомль')
INSERT [dbo].[City] ([City_Id], [Region_Id], [Title]) VALUES (7, 3, N'Белицк')
INSERT [dbo].[City] ([City_Id], [Region_Id], [Title]) VALUES (8, 3, N'Большевик')
INSERT [dbo].[City] ([City_Id], [Region_Id], [Title]) VALUES (9, 3, N'Брагин')
INSERT [dbo].[City] ([City_Id], [Region_Id], [Title]) VALUES (11, 4, N'Гродно')
INSERT [dbo].[City] ([City_Id], [Region_Id], [Title]) VALUES (12, 4, N'Лида')
INSERT [dbo].[City] ([City_Id], [Region_Id], [Title]) VALUES (13, 4, N'Мосты')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Country_Id], [Title]) VALUES (1, N'Республика Беларусь')
INSERT [dbo].[Country] ([Country_Id], [Title]) VALUES (2, N'Украина')
INSERT [dbo].[Country] ([Country_Id], [Title]) VALUES (3, N'Российская Федерация')
INSERT [dbo].[Country] ([Country_Id], [Title]) VALUES (4, N'Латвийская Республика')
INSERT [dbo].[Country] ([Country_Id], [Title]) VALUES (5, N'Литовская Республика')
INSERT [dbo].[Country] ([Country_Id], [Title]) VALUES (6, N'Республика Польша')
INSERT [dbo].[Country] ([Country_Id], [Title]) VALUES (9, N'')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Person_Id], [User_Id], [Country_Id], [Surname], [Name], [Patronymic], [IsPrimary], [Phone], [PassportNumber]) VALUES (2, 1, 1, N'Тестовый', N'Админ', N'Пароль: root', 1, N'331111111', N'PP123456')
INSERT [dbo].[Person] ([Person_Id], [User_Id], [Country_Id], [Surname], [Name], [Patronymic], [IsPrimary], [Phone], [PassportNumber]) VALUES (4, 2, 1, N'Тестовый', N'Пользователь', N'Пароль: user', 1, N'292222222', N'КН123456')
INSERT [dbo].[Person] ([Person_Id], [User_Id], [Country_Id], [Surname], [Name], [Patronymic], [IsPrimary], [Phone], [PassportNumber]) VALUES (5, 3, 2, N'Test', N'Test', N'Test', 1, N'123123123', N'QWER1234')
INSERT [dbo].[Person] ([Person_Id], [User_Id], [Country_Id], [Surname], [Name], [Patronymic], [IsPrimary], [Phone], [PassportNumber]) VALUES (6, 1, 2, N'Пример', N'Админ', N'Админ', 0, N'543345543', N'REWG2344')
INSERT [dbo].[Person] ([Person_Id], [User_Id], [Country_Id], [Surname], [Name], [Patronymic], [IsPrimary], [Phone], [PassportNumber]) VALUES (18, 4, 6, N'user1', N'user1', N'user1', 0, N'123345345', N'')
INSERT [dbo].[Person] ([Person_Id], [User_Id], [Country_Id], [Surname], [Name], [Patronymic], [IsPrimary], [Phone], [PassportNumber]) VALUES (19, 4, 2, N'test', N'test', N'test', 1, N'123123123', N'123123123')
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (1, 1, N'Брестская обл.')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (2, 1, N'Витебская обл.')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (3, 1, N'Гомельская обл.')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (4, 1, N'Гродненская обл.')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (5, 1, N'Минская обл.')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (6, 1, N'Могилевская обл.')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (7, 2, N'Винницкая обл.')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (8, 2, N'Волынская обл.')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (9, 2, N'Днепропетровская обл.')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (10, 3, N'Алтайский край')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (11, 3, N'Амурская обл.')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (12, 4, N'Латвия')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (13, 5, N'Литва')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (14, 6, N'Biala Podlaska')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (15, 6, N'Bialystok')
INSERT [dbo].[Region] ([Region_Id], [Country_Id], [Title]) VALUES (16, 6, N'Bielsko')
SET IDENTITY_INSERT [dbo].[Region] OFF
SET IDENTITY_INSERT [dbo].[Route] ON 

INSERT [dbo].[Route] ([Route_Id], [Title]) VALUES (1, N'Минск - Гродно (утро №1)')
INSERT [dbo].[Route] ([Route_Id], [Title]) VALUES (2, N'Минск - Гродно (утро №2)')
INSERT [dbo].[Route] ([Route_Id], [Title]) VALUES (3, N'Гродно - Минск (ночной №1)')
INSERT [dbo].[Route] ([Route_Id], [Title]) VALUES (4, N'Гродно - Минск (ночной №2)')
INSERT [dbo].[Route] ([Route_Id], [Title]) VALUES (5, N'Гродно - Bialystok (утро)')
INSERT [dbo].[Route] ([Route_Id], [Title]) VALUES (6, N'Bialystok - Гродно (вечер)')
INSERT [dbo].[Route] ([Route_Id], [Title]) VALUES (7, N'Минск - Рига (день. ср.)')
SET IDENTITY_INSERT [dbo].[Route] OFF
SET IDENTITY_INSERT [dbo].[Stop] ON 

INSERT [dbo].[Stop] ([Stop_Id], [City_Id], [Title]) VALUES (1, 1, N'Автовокзал Брест')
INSERT [dbo].[Stop] ([Stop_Id], [City_Id], [Title]) VALUES (2, 11, N'Автовокзал Гродно')
INSERT [dbo].[Stop] ([Stop_Id], [City_Id], [Title]) VALUES (3, 11, N'Гродно')
INSERT [dbo].[Stop] ([Stop_Id], [City_Id], [Title]) VALUES (4, 12, N'Автовокзал Лида')
INSERT [dbo].[Stop] ([Stop_Id], [City_Id], [Title]) VALUES (7, 4, N'Автовокзал Новогрудок')
INSERT [dbo].[Stop] ([Stop_Id], [City_Id], [Title]) VALUES (8, 4, N'Автовокзал Ошмяны')
SET IDENTITY_INSERT [dbo].[Stop] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_Id], [Login], [PasswordHash], [IsAdmin]) VALUES (1, N'root', N'SBNJTRN+FjG7owHVrKtue7eqdM4RhdRWVl71HXN2d7I=', 1)
INSERT [dbo].[User] ([User_Id], [Login], [PasswordHash], [IsAdmin]) VALUES (2, N'user', N'BPiZbadjt6lpsQKO4wB1aerzpjVIbdqyEdUSyFud+Ps=', 0)
INSERT [dbo].[User] ([User_Id], [Login], [PasswordHash], [IsAdmin]) VALUES (3, N'test', N'n4bQgYhMfWWaL+qgxVrQFaO/TxsrC4Is0V1sFbDwCgg=', 0)
INSERT [dbo].[User] ([User_Id], [Login], [PasswordHash], [IsAdmin]) VALUES (4, N'user1', N'SBNJTRN+FjG7owHVrKtue7eqdM4RhdRWVl71HXN2d7I=', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Vehicle] ON 

INSERT [dbo].[Vehicle] ([Vehicle_Id], [Title], [Capacity], [PlateNumber]) VALUES (1, N'Mercedes-Benz Sprinter', 16, N'1234 АВ-7')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Title], [Capacity], [PlateNumber]) VALUES (2, N'Mercedes-Benz Sprinter', 19, N'7643 АС-7')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Title], [Capacity], [PlateNumber]) VALUES (3, N'Mercedes-Benz Sprinter', 19, N'6543 АА-4')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Title], [Capacity], [PlateNumber]) VALUES (4, N'Volkswagen Crafter', 19, N'4323 КН-4')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Title], [Capacity], [PlateNumber]) VALUES (5, N'Volkswagen Crafter', 19, N'0050 МН-7')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Title], [Capacity], [PlateNumber]) VALUES (6, N'Volkswagen Crafter', 19, N'3333 АВ-5')
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Region] FOREIGN KEY([Region_Id])
REFERENCES [dbo].[Region] ([Region_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Region]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Country] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[Country] ([Country_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Country]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([User_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_User]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[Country] ([Country_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[Ride]  WITH CHECK ADD  CONSTRAINT [FK_Ride_Route] FOREIGN KEY([Route_Id])
REFERENCES [dbo].[Route] ([Route_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ride] CHECK CONSTRAINT [FK_Ride_Route]
GO
ALTER TABLE [dbo].[Ride]  WITH CHECK ADD  CONSTRAINT [FK_Ride_Vehicle] FOREIGN KEY([Vehicle_Id])
REFERENCES [dbo].[Vehicle] ([Vehicle_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ride] CHECK CONSTRAINT [FK_Ride_Vehicle]
GO
ALTER TABLE [dbo].[RideStop]  WITH CHECK ADD  CONSTRAINT [FK_RideStop_Ride] FOREIGN KEY([Ride_Id])
REFERENCES [dbo].[Ride] ([Ride_Id])
GO
ALTER TABLE [dbo].[RideStop] CHECK CONSTRAINT [FK_RideStop_Ride]
GO
ALTER TABLE [dbo].[RideStop]  WITH CHECK ADD  CONSTRAINT [FK_RideStop_RouteStop] FOREIGN KEY([RouteStop_Id])
REFERENCES [dbo].[RouteStop] ([RouteStop_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RideStop] CHECK CONSTRAINT [FK_RideStop_RouteStop]
GO
ALTER TABLE [dbo].[RouteStop]  WITH CHECK ADD  CONSTRAINT [FK_RouteStop_Route] FOREIGN KEY([Route_Id])
REFERENCES [dbo].[Route] ([Route_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RouteStop] CHECK CONSTRAINT [FK_RouteStop_Route]
GO
ALTER TABLE [dbo].[RouteStop]  WITH CHECK ADD  CONSTRAINT [FK_RouteStop_Stop] FOREIGN KEY([Stop_Id])
REFERENCES [dbo].[Stop] ([Stop_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RouteStop] CHECK CONSTRAINT [FK_RouteStop_Stop]
GO
ALTER TABLE [dbo].[Stop]  WITH CHECK ADD  CONSTRAINT [FK_Stop_City] FOREIGN KEY([City_Id])
REFERENCES [dbo].[City] ([City_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Stop] CHECK CONSTRAINT [FK_Stop_City]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Person] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[Person] ([Person_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Person]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Ride] FOREIGN KEY([Ride_Id])
REFERENCES [dbo].[Ride] ([Ride_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Ride]
GO
USE [master]
GO
ALTER DATABASE [PTL] SET  READ_WRITE 
GO
