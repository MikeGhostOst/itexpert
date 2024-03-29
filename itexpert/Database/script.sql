USE [master]
GO
/****** Object:  Database [ItExpert]    Script Date: 08/03/2024 11:38:29 ******/
CREATE DATABASE [ItExpert]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ItExpert', FILENAME = N'C:\Users\mihai\ItExpert.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ItExpert_log', FILENAME = N'C:\Users\mihai\ItExpert_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ItExpert] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ItExpert].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ItExpert] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ItExpert] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ItExpert] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ItExpert] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ItExpert] SET ARITHABORT OFF 
GO
ALTER DATABASE [ItExpert] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ItExpert] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ItExpert] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ItExpert] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ItExpert] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ItExpert] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ItExpert] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ItExpert] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ItExpert] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ItExpert] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ItExpert] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ItExpert] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ItExpert] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ItExpert] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ItExpert] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ItExpert] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ItExpert] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ItExpert] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ItExpert] SET  MULTI_USER 
GO
ALTER DATABASE [ItExpert] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ItExpert] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ItExpert] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ItExpert] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ItExpert] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ItExpert] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ItExpert] SET QUERY_STORE = OFF
GO
USE [ItExpert]
GO
/****** Object:  Table [dbo].[CodeValuePairs]    Script Date: 08/03/2024 11:38:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodeValuePairs](
	[Code] [int] NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
	[Order] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [ItExpert] SET  READ_WRITE 
GO
