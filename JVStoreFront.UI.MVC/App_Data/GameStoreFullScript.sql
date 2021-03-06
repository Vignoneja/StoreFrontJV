IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetail]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetail] DROP CONSTRAINT IF EXISTS [FK_UserDetail_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_StockStatus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Publishers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_NumPlayer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_MediaType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_ESRB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Employees]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Departments1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetail]
GO
/****** Object:  Table [dbo].[StockStatus]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[StockStatus]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[Publishers]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[Products]
GO
/****** Object:  Table [dbo].[NumPlayer]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[NumPlayer]
GO
/****** Object:  Table [dbo].[MediaType]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[MediaType]
GO
/****** Object:  Table [dbo].[ESRB]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[ESRB]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[Departments]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/13/2022 9:38:10 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ReportTo] [int] NULL,
	[HireDate] [datetime2](7) NULL,
	[Title] [varchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Country] [nchar](10) NULL,
	[ContactNum] [nvarchar](24) NULL,
	[DepartmentID] [int] NULL,
	[DirectReportID] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESRB]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESRB](
	[ESRBID] [int] IDENTITY(1,1) NOT NULL,
	[ESRBName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ESRB] PRIMARY KEY CLUSTERED 
(
	[ESRBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaType]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaType](
	[MediaID] [int] IDENTITY(1,1) NOT NULL,
	[MediaType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MediaType] PRIMARY KEY CLUSTERED 
(
	[MediaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumPlayer]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumPlayer](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[NumPlayers] [nvarchar](50) NULL,
 CONSTRAINT [PK_NumPlayer] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductTitle] [nvarchar](max) NULL,
	[ProductDesc] [nvarchar](max) NULL,
	[PlayerID] [int] NOT NULL,
	[ESRBID] [int] NULL,
	[ReleaseDate] [datetime2](7) NULL,
	[Price] [money] NOT NULL,
	[PublisherID] [int] NULL,
	[MediaID] [int] NOT NULL,
	[StockStatusID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[GameImage] [varchar](100) NULL,
	[UnitsSold] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherID] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [nvarchar](max) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockStatus]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockStatus](
	[StockStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StockStatusName] [varchar](50) NOT NULL,
	[Notes] [varchar](100) NULL,
 CONSTRAINT [PK_StockStatus] PRIMARY KEY CLUSTERED 
(
	[StockStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 1/13/2022 9:38:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetail](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](75) NOT NULL,
	[DOB] [datetime] NOT NULL,
 CONSTRAINT [PK_UserDetail] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'd2063154-3079-4ac3-9195-36bc60fbf033', N'Admin')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f745b339-8786-41d9-806c-3d1a322bc1ef', N'd2063154-3079-4ac3-9195-36bc60fbf033')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5382a6d7-6d35-416c-ab5a-f8112eda4225', N'justin.vignone@gmail.com', 0, N'AGscNm7w3WmaQzyQeSmX84LNrNtdKa09NclpBo7HaDmxUEWVNrI8vl32Im3egXzmLw==', N'f97e854c-3f6e-469c-a45b-c2e2a86923e0', NULL, 0, 0, NULL, 1, 0, N'justin.vignone@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5e9bf792-8dce-4332-8244-bcee76e0b2de', N'alibaba@gmail.com', 0, N'ABoyZdsg+e1uw0zYIqoWrlmKf4EMBIMv8WjxR83SXhmcSdsBocqKJeFpOwyh9ZdmRA==', N'19f47ba6-048d-4b6d-9f7a-549635ac3604', NULL, 0, 0, NULL, 1, 0, N'alibaba@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'775781a3-545a-4beb-bbfa-07fa3aae86f8', N'testing@gmail.com', 0, N'AMUxTB0PIkBgOieIf1sewzM7obgBFoIs/nn/YIPLdGToZF+C3556t+HMsI7XAlS6XQ==', N'6288bc11-1c55-4d6d-9bf0-54f8bbe84853', NULL, 0, 0, NULL, 1, 0, N'testing@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'aae3e220-0331-4c45-964b-c88eea94ff92', N'djangotheclown@yahoo.com', 0, N'AHIq5o6FzwM1qnMtVLylMpvr6ZChoIE7nTqH6C7CNWslVcY521lZBi7LGFQ/s2Ppwg==', N'2ef09412-8805-44a7-8624-4079922ed799', NULL, 0, 0, NULL, 1, 0, N'djangotheclown@yahoo.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ea4804a1-9ff7-4adc-9881-46d0c0dabb16', N'Teting@gmail.com', 0, N'AL56hnNfrG/ks2vuOIuYPbHb/rdCWWvw/L/d9oqm50WFBUr4hDTrpki/y/onpYC54Q==', N'76d2448b-5798-4114-83d0-116a39802353', NULL, 0, 0, NULL, 1, 0, N'Teting@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f745b339-8786-41d9-806c-3d1a322bc1ef', N'admin@StoreFront.com', 0, N'APrf7cANZWS2hirze8eDgNLObdw770sCcFJ+SraWlKhg/UNxRmZrBeuIsu6mvBGRtA==', N'09a6d6c2-b727-41c9-a2bb-afd2deef0e87', NULL, 0, 0, NULL, 1, 0, N'admin@StoreFront.com')
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DeptName]) VALUES (1, N'Sales')
INSERT [dbo].[Departments] ([DepartmentID], [DeptName]) VALUES (2, N'HR')
INSERT [dbo].[Departments] ([DepartmentID], [DeptName]) VALUES (3, N'IT')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[ESRB] ON 

INSERT [dbo].[ESRB] ([ESRBID], [ESRBName]) VALUES (1, N'EC')
INSERT [dbo].[ESRB] ([ESRBID], [ESRBName]) VALUES (2, N'E')
INSERT [dbo].[ESRB] ([ESRBID], [ESRBName]) VALUES (3, N'E10+')
INSERT [dbo].[ESRB] ([ESRBID], [ESRBName]) VALUES (4, N'T')
INSERT [dbo].[ESRB] ([ESRBID], [ESRBName]) VALUES (5, N'M')
INSERT [dbo].[ESRB] ([ESRBID], [ESRBName]) VALUES (6, N'A')
SET IDENTITY_INSERT [dbo].[ESRB] OFF
GO
SET IDENTITY_INSERT [dbo].[MediaType] ON 

INSERT [dbo].[MediaType] ([MediaID], [MediaType]) VALUES (1, N'Digital')
INSERT [dbo].[MediaType] ([MediaID], [MediaType]) VALUES (2, N'Physical')
INSERT [dbo].[MediaType] ([MediaID], [MediaType]) VALUES (3, N'Digital & Physical')
SET IDENTITY_INSERT [dbo].[MediaType] OFF
GO
SET IDENTITY_INSERT [dbo].[NumPlayer] ON 

INSERT [dbo].[NumPlayer] ([PlayerID], [NumPlayers]) VALUES (1, N'1')
INSERT [dbo].[NumPlayer] ([PlayerID], [NumPlayers]) VALUES (2, N'1 to 2')
INSERT [dbo].[NumPlayer] ([PlayerID], [NumPlayers]) VALUES (3, N'1 to 3')
INSERT [dbo].[NumPlayer] ([PlayerID], [NumPlayers]) VALUES (4, N'1 to 4')
INSERT [dbo].[NumPlayer] ([PlayerID], [NumPlayers]) VALUES (5, N'1 to 12')
INSERT [dbo].[NumPlayer] ([PlayerID], [NumPlayers]) VALUES (6, N'1 to 24')
INSERT [dbo].[NumPlayer] ([PlayerID], [NumPlayers]) VALUES (7, N'1 to 30')
SET IDENTITY_INSERT [dbo].[NumPlayer] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (1, N'Hades', N'Defy the god of the dead as you hack and slash out of the Underworld in this rouge-like dungeon crawler from the creators of Bastion and Transistor', 1, 2, CAST(N'2021-03-19T00:00:00.0000000' AS DateTime2), 32.9900, 1, 3, 1, 12, N'23d3dee1-0b56-4345-ab7c-b28906c46ccd.jpg', NULL)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (4, N'Neon Abyss', N'Neon Abyss is a frantic, roguelite action-platformer where you run ‘n’ gun your way into the Abyss. Featuring unlimited item synergies and a unique dungeon evolution system, each run diversifies the experience and every choice alters the ruleset.', 1, 1, CAST(N'2020-07-14T00:00:00.0000000' AS DateTime2), 19.9900, 2, 1, 1, NULL, N'cd4df78b-66b3-4857-8ee6-36a6a2cef01e.jpg', NULL)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (5, N'Fallout 4', N'Bethesda Game Studios, the award-winning creators of Fallout 3 and The Elder Scrolls V: Skyrim, welcome you to the world of Fallout 4 – their most ambitious game ever, and the next generation of open-world gaming.', 1, 5, CAST(N'2015-11-09T00:00:00.0000000' AS DateTime2), 19.9900, 4, 1, 1, 15, N'78ab4f1d-1de5-46fd-8a0a-0385253fd10e.jpeg', NULL)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (6, N'For The King', N'For The King is a strategic RPG that blends tabletop and roguelike elements in a challenging adventure that spans the realms. Set off on a single player experience or play cooperatively both online and locally. None before you have returned from their journey. Will you put an end to the Chaos?  For The King is a challenging blend of strategy, turn-based combat, and roguelike elements. Each playthrough is unique with procedural maps, quests, and events. Explore Fahrul in either single player, local, or online co-op.  Just remember adventurer, you do this not for riches or fame but for your village, for your realm, For The King!  INCLUDES ALL PREVIOUSLY RELEASED CONTENT EXPANSIONS!', 3, 4, CAST(N'2019-05-09T00:00:00.0000000' AS DateTime2), 24.9900, 10, 1, 1, 9999, N'9bc09bdb-cb9c-4859-8bb0-6c04c458f622.jpg', 150)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (7, N'Demon''s Tilt', N'TURBO CHARGED PINBALL RETURNS! Now with bigger sprites, more baddies, more secrets & MORE BULLETS! Demon''s Tilt pushes the limits of the Video Pinball genre with SHMUP & Hack N'' Slash elements.', 1, 2, CAST(N'2019-12-23T00:00:00.0000000' AS DateTime2), 19.9900, 3, 1, 1, NULL, N'cec90aa0-5e83-4a12-8435-89033f01b322.png', 15)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (8, N'Doom', N'Experience the classic demon-blasting fun that popularized the genre home or on-the-go.', 4, 5, CAST(N'1993-12-10T00:00:00.0000000' AS DateTime2), 4.9900, 4, 1, 1, NULL, N'dadd5d91-bb0f-446e-8519-bf87f2cdf38a.jpg', 1500)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (9, N'Doom II', N'Celebrate DOOM''s 25th anniversary with the re-release of DOOM II. This beloved sequel to the groundbreaking DOOM (1993) gave players the brutal Super Shotgun to bear against deadlier demons, and the infamous boss, the Icon of Sin.', 4, 5, CAST(N'1994-12-10T00:00:00.0000000' AS DateTime2), 4.9900, 4, 1, 1, NULL, N'be1553bc-426a-4415-9de3-e4be1d24145d.png', 15299)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (10, N'Super Mario Party', N'Party like you''ve never partied before', 4, 2, CAST(N'2018-10-05T00:00:00.0000000' AS DateTime2), 59.9900, 5, 3, 1, 15, N'82089778-7075-4a44-b2a8-a2ad4bc4e1dd.jpg', 189)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (11, N'Risk of Rain 2', N'Escape a chaotic alien planet by fighting through hordes of frenzied monsters – with your friends, or on your own.', 4, 4, CAST(N'2019-08-30T00:00:00.0000000' AS DateTime2), 24.9900, 6, 1, 1, NULL, N'8f4ddf68-8263-40ad-a72a-6a0bd4b1a268.jpg', 3259)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (12, N'Crash Bandicoot N.Sane Trilogy', N'Your favorite marsupial, Crash Bandicoot™, is back! He’s enhanced, entranced and ready-to-dance with the N. Sane Trilogy game collection. Now you can experience Crash Bandicoot like never before. Spin, jump, wump and repeat as you take on the epic challenges and adventures through the three games that started it all, Crash Bandicoot™, Crash Bandicoot™ 2: Cortex Strikes Back and Crash Bandicoot™ 3: Warped.', 1, 2, CAST(N'2018-06-29T00:00:00.0000000' AS DateTime2), 39.9900, 7, 3, 1, 45, N'22ed214d-510b-48a3-b552-de2f1075c8a1.jpg', 79)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (13, N'Dungeon of the Endless', N'Dungeon of the Endless is the award-winning Rogue-Like Dungeon-Defense game, in which you and your team of heroes must protect the generator of your crashed ship while exploring an ever-expanding dungeon, all while facing waves of monsters and special events as you try to find your way out...', 1, 4, CAST(N'2020-05-15T00:00:00.0000000' AS DateTime2), 19.9900, 8, 1, 1, NULL, N'36488a59-8f43-44b5-8ab6-6e7939f0c683.png', 42)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (14, N'Mario Kart 8 Deluxe', N'Hit the road with the definitive version of Mario Kart 8 and play anytime, anywhere! Race your friends or battle them in a revised battle mode on new and returning battle courses. Play locally in up to 4-player multiplayer in 1080p while playing in TV Mode. Every track from the Wii U version, including DLC, makes a glorious return. Plus, the Inklings appear as all-new guest characters, along with returning favorites, such as King Boo, Dry Bones, and Bowser Jr.!', 5, 2, CAST(N'2017-04-28T00:00:00.0000000' AS DateTime2), 59.9900, 5, 3, 1, 5, N'a53f8db9-31a7-4188-968a-039395acb333.jpg', 153)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (15, N'Battle Chess', N'Everyone who''s ever had a knight take a pawn, has seen that capture as more than one piece replacing another on the board. In players'' minds, the bold knight, resplendent in his armor of silver or ebon, sallies forth and slays the foul foot soldier. Combat, mortal combat, lies in the heart and soul of chess, but this aspect of it could only live in the mind''s eye – until now!', 2, 2, CAST(N'1988-06-22T00:00:00.0000000' AS DateTime2), 4.9900, 11, 2, 1, 0, N'e6bef382-a551-4aa3-b95a-e42868edf418.png', 3)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (16, N'Commander Keen', N'You are eight-year-old Billy Blaze, boy genius to your neighborhood. Commander Keen to the rest of the universe. It''s time to grab your trusty pogo stick and neural stunner, climb into the cockpit of your homemade Megarocket and blast off for the Shadowlands. To prevent the obliteration of life as we know it, you''ll have to battle your way past deadly hazards and devious creatures, or end up as space toast.', 1, 2, CAST(N'1990-12-14T00:00:00.0000000' AS DateTime2), 4.9900, 12, 2, 2, NULL, N'3372922d-946c-4713-bf6b-67931a2b092a.jpeg', 6)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (17, N'Heretic', N'In a twisted medieval dimension, undead creatures and bestial horrors have done the unthinkable--callously slaughtering your entire race. Your friends. Your family. Eliminated. But the nightmare has just begun.', 4, 5, CAST(N'1994-12-23T00:00:00.0000000' AS DateTime2), 4.9900, 13, 1, 1, NULL, N'1d448dac-99c5-4d1d-ade2-30d61912885f.png', 47)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (18, N'The Legend of Zelda: Breath of the Wild', N'Forget everything you know about The Legend of Zelda games. Step into a world of discovery, exploration, and adventure in The Legend of Zelda: Breath of the Wild, a boundary-breaking new game in the acclaimed series. Travel across vast fields, through forests, and to mountain peaks as you discover what has become of the kingdom of Hyrule in this stunning Open-Air Adventure. Now on Nintendo Switch, your journey is freer and more open than ever. Take your system anywhere, and adventure as Link any way you like.', 1, 2, CAST(N'2017-03-03T00:00:00.0000000' AS DateTime2), 59.9900, 5, 3, 1, 25, N'9f70c0b8-6184-4239-9b2b-8a33352594c0.jpg', 8256)
INSERT [dbo].[Products] ([ProductId], [ProductTitle], [ProductDesc], [PlayerID], [ESRBID], [ReleaseDate], [Price], [PublisherID], [MediaID], [StockStatusID], [Quantity], [GameImage], [UnitsSold]) VALUES (19, N'Enter the Gungeon', N'Enter the Gungeon is a bullet hell dungeon crawler following a band of misfits seeking to shoot, loot, dodge roll and table-flip their way to personal absolution by reaching the legendary Gungeon’s ultimate treasure: the gun that can kill the past. Select a hero [or team up in co-op] and battle your way to the bottom of the Gungeon by surviving a challenging and evolving series of floors filled with the dangerously adorable Gundead and fearsome Gungeon bosses armed to the teeth. Gather precious loot, discover hidden secrets, and chat with opportunistic merchants and shopkeepers to purchase powerful items to gain an edge.', 2, 4, CAST(N'2017-12-14T00:00:00.0000000' AS DateTime2), 14.9900, 9, 1, 1, NULL, N'991b0c08-7462-4003-b921-6d2120a832a4.jpg', 325)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Publishers] ON 

INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [Country], [IsActive]) VALUES (1, N'Supergiant Games', N'San Francisco', N'CA', N'USA', NULL)
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [Country], [IsActive]) VALUES (2, N'Team17', N'Wakefield', NULL, N'UK', NULL)
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [Country], [IsActive]) VALUES (3, N'FLARB', N'Pasadena', N'CA', N'USA', NULL)
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [Country], [IsActive]) VALUES (4, N'Bethesda', N'Rockville', N'MD', N'USA', NULL)
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [Country], [IsActive]) VALUES (5, N'Nintendo', N'Kyoto', NULL, N'JP', NULL)
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [Country], [IsActive]) VALUES (6, N'Gearbox', N'Frisco', N'TX', N'USA', NULL)
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [Country], [IsActive]) VALUES (7, N'Activision', N'Santa MOnica', N'CA', N'USA', NULL)
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [Country], [IsActive]) VALUES (8, N'Playdigious', N'Nancy', NULL, N'FR', NULL)
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [Country], [IsActive]) VALUES (9, N'Dodge Roll', N'Auburn Hills', N'MI', N'USA', NULL)
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [Country], [IsActive]) VALUES (10, N'Curve Digital', N'London', NULL, N'UK', NULL)
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [Country], [IsActive]) VALUES (11, N'Interplay Productions', N'Los Angeles', N'CA', N'USA', NULL)
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [Country], [IsActive]) VALUES (12, N'3D Realms', N'Garland', N'TX', N'USA', NULL)
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [Country], [IsActive]) VALUES (13, N'id Software', N'Richardson', N'TX', N'USA', NULL)
SET IDENTITY_INSERT [dbo].[Publishers] OFF
GO
SET IDENTITY_INSERT [dbo].[StockStatus] ON 

INSERT [dbo].[StockStatus] ([StockStatusID], [StockStatusName], [Notes]) VALUES (1, N'In Stock', NULL)
INSERT [dbo].[StockStatus] ([StockStatusID], [StockStatusName], [Notes]) VALUES (2, N'Out of Stock', NULL)
INSERT [dbo].[StockStatus] ([StockStatusID], [StockStatusName], [Notes]) VALUES (3, N'Discontinued', NULL)
INSERT [dbo].[StockStatus] ([StockStatusID], [StockStatusName], [Notes]) VALUES (4, N'Backordered', NULL)
SET IDENTITY_INSERT [dbo].[StockStatus] OFF
GO
INSERT [dbo].[UserDetail] ([UserID], [FirstName], [LastName], [DOB]) VALUES (N'5e9bf792-8dce-4332-8244-bcee76e0b2de', N'Test', N'Test', CAST(N'1987-07-12T00:00:00.000' AS DateTime))
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments1] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments1]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([DirectReportID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ESRB] FOREIGN KEY([ESRBID])
REFERENCES [dbo].[ESRB] ([ESRBID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ESRB]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_MediaType] FOREIGN KEY([MediaID])
REFERENCES [dbo].[MediaType] ([MediaID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_MediaType]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_NumPlayer] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[NumPlayer] ([PlayerID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_NumPlayer]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Publishers] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publishers] ([PublisherID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Publishers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_StockStatus] FOREIGN KEY([StockStatusID])
REFERENCES [dbo].[StockStatus] ([StockStatusID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_StockStatus]
GO
ALTER TABLE [dbo].[UserDetail]  WITH CHECK ADD  CONSTRAINT [FK_UserDetail_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserDetail] CHECK CONSTRAINT [FK_UserDetail_AspNetUsers]
GO
