USE [master]
GO
/****** Object:  Database [PTT_CRM]    Script Date: 7.04.2023 16:17:05 ******/
CREATE DATABASE [PTT_CRM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PTT_CRM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PTT_CRM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PTT_CRM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PTT_CRM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PTT_CRM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PTT_CRM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PTT_CRM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PTT_CRM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PTT_CRM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PTT_CRM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PTT_CRM] SET ARITHABORT OFF 
GO
ALTER DATABASE [PTT_CRM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PTT_CRM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PTT_CRM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PTT_CRM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PTT_CRM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PTT_CRM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PTT_CRM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PTT_CRM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PTT_CRM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PTT_CRM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PTT_CRM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PTT_CRM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PTT_CRM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PTT_CRM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PTT_CRM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PTT_CRM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PTT_CRM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PTT_CRM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PTT_CRM] SET  MULTI_USER 
GO
ALTER DATABASE [PTT_CRM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PTT_CRM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PTT_CRM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PTT_CRM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PTT_CRM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PTT_CRM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PTT_CRM] SET QUERY_STORE = OFF
GO
USE [PTT_CRM]
GO
/****** Object:  Table [dbo].[Birim]    Script Date: 7.04.2023 16:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Birim](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Kod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BirimId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cevap]    Script Date: 7.04.2023 16:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cevap](
	[Id] [uniqueidentifier] NOT NULL,
	[MesajId] [uniqueidentifier] NOT NULL,
	[Cevap] [nvarchar](4000) NOT NULL,
	[BirimId] [smallint] NOT NULL,
	[PersonelId] [int] NOT NULL,
	[Tarih] [datetime] NOT NULL,
 CONSTRAINT [PK_Cevap] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HizmetTip]    Script Date: 7.04.2023 16:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HizmetTip](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Kod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HizmetTipId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HizmetTipAlt]    Script Date: 7.04.2023 16:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HizmetTipAlt](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[HizmetTipId] [smallint] NOT NULL,
	[Kod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HizmetTipAltId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 7.04.2023 16:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
	[EPosta] [varchar](50) NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kurum]    Script Date: 7.04.2023 16:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kurum](
	[Id] [int] NOT NULL,
	[VergiNo] [nvarchar](50) NOT NULL,
	[Ad] [nvarchar](150) NOT NULL,
	[Adres] [nvarchar](500) NOT NULL,
	[SehirId] [smallint] NOT NULL,
 CONSTRAINT [PK_Kurum] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesaj]    Script Date: 7.04.2023 16:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesaj](
	[Id] [uniqueidentifier] NOT NULL,
	[MusteriId] [int] NOT NULL,
	[KurumId] [int] NULL,
	[MesajTurId] [smallint] NOT NULL,
	[HizmetTipId] [smallint] NOT NULL,
	[HizmetTipAltId] [smallint] NULL,
	[Icerik] [nvarchar](1900) NOT NULL,
	[IpAdress] [nchar](10) NULL,
	[MesajDurumId] [smallint] NOT NULL,
	[OlusturmaTarih] [datetime] NULL,
 CONSTRAINT [PK_Mesaj] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesajDurum]    Script Date: 7.04.2023 16:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MesajDurum](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Kod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MesajDurumId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesajTur]    Script Date: 7.04.2023 16:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MesajTur](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Kod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MesajTur] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 7.04.2023 16:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KimlikTurId] [smallint] NOT NULL,
	[KimlikNo] [varchar](50) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[EPosta] [varchar](50) NOT NULL,
	[GSM] [char](10) NULL,
 CONSTRAINT [PK_Musteri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sehir]    Script Date: 7.04.2023 16:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sehir](
	[Id] [smallint] NOT NULL,
	[Kod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SehirId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Surec]    Script Date: 7.04.2023 16:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surec](
	[Id] [uniqueidentifier] NOT NULL,
	[MesajId] [uniqueidentifier] NOT NULL,
	[SurecDurumId] [smallint] NOT NULL,
	[BirimId] [smallint] NULL,
	[PersonelId] [smallint] NULL,
	[Not] [nvarchar](4000) NULL,
	[Tarih] [datetime] NOT NULL,
 CONSTRAINT [PK_Surec] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurecDurum]    Script Date: 7.04.2023 16:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurecDurum](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Kod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SurecDurumId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HizmetTip] ON 

INSERT [dbo].[HizmetTip] ([Id], [Kod]) VALUES (1, N'Kargo')
SET IDENTITY_INSERT [dbo].[HizmetTip] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([Id], [KullaniciAdi], [Ad], [Soyad], [EPosta]) VALUES (1, N'mcavdar', N'Mustafa', N'Çavdaroğlu', N'mcavdar89@gmail.com')
INSERT [dbo].[Kullanici] ([Id], [KullaniciAdi], [Ad], [Soyad], [EPosta]) VALUES (2, N'acak', N'Asiye', N'Çak', N'asiye.cak@ptt.gov.tr')
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
INSERT [dbo].[Kurum] ([Id], [VergiNo], [Ad], [Adres], [SehirId]) VALUES (1, N'111', N'PTT', N'Ankara', 6)
GO
INSERT [dbo].[Mesaj] ([Id], [MusteriId], [KurumId], [MesajTurId], [HizmetTipId], [HizmetTipAltId], [Icerik], [IpAdress], [MesajDurumId], [OlusturmaTarih]) VALUES (N'd30dbdee-d8f9-4445-aeb4-12ea0b80d747', 1, 1, 1, 1, NULL, N'Deneme', NULL, 1, NULL)
INSERT [dbo].[Mesaj] ([Id], [MusteriId], [KurumId], [MesajTurId], [HizmetTipId], [HizmetTipAltId], [Icerik], [IpAdress], [MesajDurumId], [OlusturmaTarih]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 2, 1, 1, 1, NULL, N'deneme', N'string    ', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[MesajDurum] ON 

INSERT [dbo].[MesajDurum] ([Id], [Kod]) VALUES (1, N'Oluşuturulma')
INSERT [dbo].[MesajDurum] ([Id], [Kod]) VALUES (2, N'Birime Atama')
INSERT [dbo].[MesajDurum] ([Id], [Kod]) VALUES (3, N'Cevap Dönülmesi')
SET IDENTITY_INSERT [dbo].[MesajDurum] OFF
GO
SET IDENTITY_INSERT [dbo].[MesajTur] ON 

INSERT [dbo].[MesajTur] ([Id], [Kod]) VALUES (1, N'Şikayet')
SET IDENTITY_INSERT [dbo].[MesajTur] OFF
GO
SET IDENTITY_INSERT [dbo].[Musteri] ON 

INSERT [dbo].[Musteri] ([Id], [KimlikTurId], [KimlikNo], [Ad], [Soyad], [EPosta], [GSM]) VALUES (1, 1, N'111', N'Mustafa', N'Çavdaroğlu', N'mcavdar89@gmail.com', N'5412650155')
INSERT [dbo].[Musteri] ([Id], [KimlikTurId], [KimlikNo], [Ad], [Soyad], [EPosta], [GSM]) VALUES (2, 1, N'122', N'Reyhan', N'Martı', N'reyhan.marti@ptt.gov.tr', N'2324      ')
SET IDENTITY_INSERT [dbo].[Musteri] OFF
GO
INSERT [dbo].[Sehir] ([Id], [Kod]) VALUES (6, N'Ankara')
GO
ALTER TABLE [dbo].[Cevap]  WITH CHECK ADD  CONSTRAINT [FK_Cevap_Birim_BirimId] FOREIGN KEY([BirimId])
REFERENCES [dbo].[Birim] ([Id])
GO
ALTER TABLE [dbo].[Cevap] CHECK CONSTRAINT [FK_Cevap_Birim_BirimId]
GO
ALTER TABLE [dbo].[HizmetTipAlt]  WITH CHECK ADD  CONSTRAINT [FK_HizmetTipAlt_HizmetTip_HizmetTipId] FOREIGN KEY([HizmetTipId])
REFERENCES [dbo].[HizmetTip] ([Id])
GO
ALTER TABLE [dbo].[HizmetTipAlt] CHECK CONSTRAINT [FK_HizmetTipAlt_HizmetTip_HizmetTipId]
GO
ALTER TABLE [dbo].[Kurum]  WITH CHECK ADD  CONSTRAINT [FK_Kurum_Sehir_SehirId] FOREIGN KEY([SehirId])
REFERENCES [dbo].[Sehir] ([Id])
GO
ALTER TABLE [dbo].[Kurum] CHECK CONSTRAINT [FK_Kurum_Sehir_SehirId]
GO
ALTER TABLE [dbo].[Mesaj]  WITH CHECK ADD  CONSTRAINT [FK_Mesaj_HizmetTip_HizmetTipId] FOREIGN KEY([HizmetTipId])
REFERENCES [dbo].[HizmetTip] ([Id])
GO
ALTER TABLE [dbo].[Mesaj] CHECK CONSTRAINT [FK_Mesaj_HizmetTip_HizmetTipId]
GO
ALTER TABLE [dbo].[Mesaj]  WITH CHECK ADD  CONSTRAINT [FK_Mesaj_HizmetTipAlt_HizmetTipAltId] FOREIGN KEY([HizmetTipAltId])
REFERENCES [dbo].[HizmetTipAlt] ([Id])
GO
ALTER TABLE [dbo].[Mesaj] CHECK CONSTRAINT [FK_Mesaj_HizmetTipAlt_HizmetTipAltId]
GO
ALTER TABLE [dbo].[Mesaj]  WITH CHECK ADD  CONSTRAINT [FK_Mesaj_Kurum_KurumId] FOREIGN KEY([KurumId])
REFERENCES [dbo].[Kurum] ([Id])
GO
ALTER TABLE [dbo].[Mesaj] CHECK CONSTRAINT [FK_Mesaj_Kurum_KurumId]
GO
ALTER TABLE [dbo].[Mesaj]  WITH CHECK ADD  CONSTRAINT [FK_Mesaj_MesajDurum_MesajDurumId] FOREIGN KEY([MesajDurumId])
REFERENCES [dbo].[MesajDurum] ([Id])
GO
ALTER TABLE [dbo].[Mesaj] CHECK CONSTRAINT [FK_Mesaj_MesajDurum_MesajDurumId]
GO
ALTER TABLE [dbo].[Mesaj]  WITH CHECK ADD  CONSTRAINT [FK_Mesaj_MesajTur_MesajTurId] FOREIGN KEY([MesajTurId])
REFERENCES [dbo].[MesajTur] ([Id])
GO
ALTER TABLE [dbo].[Mesaj] CHECK CONSTRAINT [FK_Mesaj_MesajTur_MesajTurId]
GO
ALTER TABLE [dbo].[Mesaj]  WITH CHECK ADD  CONSTRAINT [FK_Mesaj_Musteri_MusteriId] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[Musteri] ([Id])
GO
ALTER TABLE [dbo].[Mesaj] CHECK CONSTRAINT [FK_Mesaj_Musteri_MusteriId]
GO
ALTER TABLE [dbo].[Surec]  WITH CHECK ADD  CONSTRAINT [FK_Surec_Birim_BirimId] FOREIGN KEY([BirimId])
REFERENCES [dbo].[Birim] ([Id])
GO
ALTER TABLE [dbo].[Surec] CHECK CONSTRAINT [FK_Surec_Birim_BirimId]
GO
ALTER TABLE [dbo].[Surec]  WITH CHECK ADD  CONSTRAINT [FK_Surec_Mesaj_MesajId] FOREIGN KEY([MesajId])
REFERENCES [dbo].[Mesaj] ([Id])
GO
ALTER TABLE [dbo].[Surec] CHECK CONSTRAINT [FK_Surec_Mesaj_MesajId]
GO
ALTER TABLE [dbo].[Surec]  WITH CHECK ADD  CONSTRAINT [FK_Surec_SurecDurum_SurecDurumId] FOREIGN KEY([SurecDurumId])
REFERENCES [dbo].[SurecDurum] ([Id])
GO
ALTER TABLE [dbo].[Surec] CHECK CONSTRAINT [FK_Surec_SurecDurum_SurecDurumId]
GO
USE [master]
GO
ALTER DATABASE [PTT_CRM] SET  READ_WRITE 
GO
