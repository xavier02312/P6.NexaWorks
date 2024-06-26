USE [P6BDD]
GO
/****** Object:  Table [dbo].[Produit]    Script Date: 21/05/2024 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produit](
	[Id] [int] NOT NULL,
	[NomProduit] [nvarchar](50) NULL,
 CONSTRAINT [PK_Produit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProduitsSystemes]    Script Date: 21/05/2024 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProduitsSystemes](
	[ProduitId] [int] NULL,
	[SystemeExploitationId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemeExploitation]    Script Date: 21/05/2024 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemeExploitation](
	[Id] [int] NOT NULL,
	[NomOS] [nvarchar](50) NULL,
 CONSTRAINT [PK_SystemeExploitation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 21/05/2024 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Id] [int] NULL,
	[ProduitId] [int] NULL,
	[VersionId] [int] NULL,
	[SystemeExploitationId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Resolution] [nvarchar](max) NULL,
	[DateDeCreation] [date] NULL,
	[DateDeResolution] [date] NULL,
	[Statut] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Version]    Script Date: 21/05/2024 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Version](
	[Id] [int] NOT NULL,
	[NumVersion] [float] NULL,
 CONSTRAINT [PK_Version_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VersionProduit]    Script Date: 21/05/2024 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionProduit](
	[VersionId] [int] NULL,
	[ProduitId] [int] NULL,
	[SystemeExploitationId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VersionsSystemes]    Script Date: 21/05/2024 12:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionsSystemes](
	[VersionId] [int] NULL,
	[SystemeExploitationId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProduitsSystemes]  WITH CHECK ADD  CONSTRAINT [FK_ProduitsSystemes_Produit] FOREIGN KEY([ProduitId])
REFERENCES [dbo].[Produit] ([Id])
GO
ALTER TABLE [dbo].[ProduitsSystemes] CHECK CONSTRAINT [FK_ProduitsSystemes_Produit]
GO
ALTER TABLE [dbo].[ProduitsSystemes]  WITH CHECK ADD  CONSTRAINT [FK_ProduitsSystemes_SystemeExploitation] FOREIGN KEY([SystemeExploitationId])
REFERENCES [dbo].[SystemeExploitation] ([Id])
GO
ALTER TABLE [dbo].[ProduitsSystemes] CHECK CONSTRAINT [FK_ProduitsSystemes_SystemeExploitation]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Produit] FOREIGN KEY([ProduitId])
REFERENCES [dbo].[Produit] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Produit]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_SystemeExploitation] FOREIGN KEY([SystemeExploitationId])
REFERENCES [dbo].[SystemeExploitation] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_SystemeExploitation]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Version] FOREIGN KEY([VersionId])
REFERENCES [dbo].[Version] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Version]
GO
ALTER TABLE [dbo].[VersionProduit]  WITH CHECK ADD  CONSTRAINT [FK_VersionProduit_Produit] FOREIGN KEY([ProduitId])
REFERENCES [dbo].[Produit] ([Id])
GO
ALTER TABLE [dbo].[VersionProduit] CHECK CONSTRAINT [FK_VersionProduit_Produit]
GO
ALTER TABLE [dbo].[VersionProduit]  WITH CHECK ADD  CONSTRAINT [FK_VersionProduit_SystemeExploitation] FOREIGN KEY([SystemeExploitationId])
REFERENCES [dbo].[SystemeExploitation] ([Id])
GO
ALTER TABLE [dbo].[VersionProduit] CHECK CONSTRAINT [FK_VersionProduit_SystemeExploitation]
GO
ALTER TABLE [dbo].[VersionProduit]  WITH CHECK ADD  CONSTRAINT [FK_VersionProduit_Version] FOREIGN KEY([VersionId])
REFERENCES [dbo].[Version] ([Id])
GO
ALTER TABLE [dbo].[VersionProduit] CHECK CONSTRAINT [FK_VersionProduit_Version]
GO
ALTER TABLE [dbo].[VersionsSystemes]  WITH CHECK ADD  CONSTRAINT [FK_VersionsSystemes_SystemeExploitation] FOREIGN KEY([SystemeExploitationId])
REFERENCES [dbo].[SystemeExploitation] ([Id])
GO
ALTER TABLE [dbo].[VersionsSystemes] CHECK CONSTRAINT [FK_VersionsSystemes_SystemeExploitation]
GO
ALTER TABLE [dbo].[VersionsSystemes]  WITH CHECK ADD  CONSTRAINT [FK_VersionsSystemes_Version] FOREIGN KEY([VersionId])
REFERENCES [dbo].[Version] ([Id])
GO
ALTER TABLE [dbo].[VersionsSystemes] CHECK CONSTRAINT [FK_VersionsSystemes_Version]
GO
