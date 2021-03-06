USE [master]
GO
/****** Object:  Database [BlogsTestGrapeCity]    Script Date: 17-04-2021 20:43:57 ******/
CREATE DATABASE [BlogsTestGrapeCity]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlogsTestGrapeCity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BlogsTestGrapeCity.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BlogsTestGrapeCity_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BlogsTestGrapeCity_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BlogsTestGrapeCity] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlogsTestGrapeCity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlogsTestGrapeCity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET RECOVERY FULL 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET  MULTI_USER 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlogsTestGrapeCity] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BlogsTestGrapeCity] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BlogsTestGrapeCity', N'ON'
GO
ALTER DATABASE [BlogsTestGrapeCity] SET QUERY_STORE = OFF
GO
USE [BlogsTestGrapeCity]
GO
/****** Object:  Table [dbo].[tbl_Blog]    Script Date: 17-04-2021 20:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Blog_Content] [nvarchar](max) NOT NULL,
	[CreatedUserID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 17-04-2021 20:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastLogOnDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Blog] ON 

INSERT [dbo].[tbl_Blog] ([Id], [Title], [Blog_Content], [CreatedUserID], [CreatedDate], [UpdatedDate]) VALUES (1, N'Sparsh Saxena', N'fill', 2, CAST(N'2021-04-17T19:23:08.120' AS DateTime), CAST(N'2021-04-17T20:24:37.287' AS DateTime))
INSERT [dbo].[tbl_Blog] ([Id], [Title], [Blog_Content], [CreatedUserID], [CreatedDate], [UpdatedDate]) VALUES (2, N'Ankit', N'Blog', 2, CAST(N'2021-04-17T19:25:33.793' AS DateTime), CAST(N'2021-04-17T20:13:12.003' AS DateTime))
INSERT [dbo].[tbl_Blog] ([Id], [Title], [Blog_Content], [CreatedUserID], [CreatedDate], [UpdatedDate]) VALUES (3, N'Hello', N'My Blogs', 2, CAST(N'2021-04-17T19:25:56.830' AS DateTime), CAST(N'2021-04-17T19:25:56.830' AS DateTime))
INSERT [dbo].[tbl_Blog] ([Id], [Title], [Blog_Content], [CreatedUserID], [CreatedDate], [UpdatedDate]) VALUES (4, N'popup', N'test12345', 2, CAST(N'2021-04-17T19:49:24.890' AS DateTime), CAST(N'2021-04-17T20:20:38.570' AS DateTime))
INSERT [dbo].[tbl_Blog] ([Id], [Title], [Blog_Content], [CreatedUserID], [CreatedDate], [UpdatedDate]) VALUES (8, N'Sunny', N'Blog', 2, CAST(N'2021-04-17T20:13:23.037' AS DateTime), CAST(N'2021-04-17T20:13:23.037' AS DateTime))
INSERT [dbo].[tbl_Blog] ([Id], [Title], [Blog_Content], [CreatedUserID], [CreatedDate], [UpdatedDate]) VALUES (9, N'error', N'handel', 2, CAST(N'2021-04-17T20:22:39.473' AS DateTime), CAST(N'2021-04-17T20:24:18.213' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_User] ON 

INSERT [dbo].[tbl_User] ([Id], [FirstName], [LastName], [Email], [Password], [CreatedDate], [LastLogOnDate]) VALUES (2, N'Sparsh', N'Saxena', N'test@grapecity.com', N'test', CAST(N'2021-04-17T00:00:00.000' AS DateTime), CAST(N'2021-04-17T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_User] OFF
GO
ALTER TABLE [dbo].[tbl_Blog]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Blog_tbl_User] FOREIGN KEY([CreatedUserID])
REFERENCES [dbo].[tbl_User] ([Id])
GO
ALTER TABLE [dbo].[tbl_Blog] CHECK CONSTRAINT [FK_tbl_Blog_tbl_User]
GO
USE [master]
GO
ALTER DATABASE [BlogsTestGrapeCity] SET  READ_WRITE 
GO
