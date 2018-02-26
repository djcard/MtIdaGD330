/****** Object:  Table [dbo].[books]    Script Date: 2/25/2018 11:33:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[books](
  [ISBN13] [nvarchar](13) NOT NULL,
  [title] [nvarchar](50) NULL,
  [year] [int] NULL,
  [isbn] [nvarchar](10) NULL,
  [weight] [numeric](18, 0) NULL,
  [binding] [nvarchar](40) NULL,
  [pages] [int] NULL,
  [language] [nvarchar](40) NULL,
  [publisher] [nvarchar](40) NULL,
  [coverimage] [nvarchar](125) NULL,
  [description] [nvarchar](max) NULL,
  [rowid] [int] IDENTITY(1,1) NOT NULL,
  CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED
    (
      [ISBN13] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[content]    Script Date: 2/25/2018 11:36:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[content](
  [contentid] [nvarchar](40) NULL,
  [title] [nvarchar](50) NULL,
  [description] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[genres]    Script Date: 2/25/2018 11:37:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[genres](
  [genreid] [nvarchar](40) NOT NULL,
  [genrename] [nvarchar](50) NULL,
  [genredescription] [nvarchar](500) NULL,
  [genreTEMP] [int] NOT NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[genrestobooks]    Script Date: 2/25/2018 11:38:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[genrestobooks](
  [isbn13] [nvarchar](13) NULL,
  [genreid] [nvarchar](40) NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[passwords]    Script Date: 2/25/2018 11:39:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[passwords](
  [personid] [nvarchar](40) NOT NULL,
  [password] [nvarchar](100) NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[people]    Script Date: 2/25/2018 11:39:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[people](
  [id] [nvarchar](40) NOT NULL,
  [title] [nvarchar](10) NULL,
  [firstname] [nvarchar](25) NULL,
  [lastname] [nvarchar](30) NULL,
  [email] [nvarchar](50) NULL,
  [isadmin] [int] NULL,
  [personid] [nchar](10) NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[persontorole]    Script Date: 2/25/2018 11:39:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[persontorole](
  [bookid] [nvarchar](13) NOT NULL,
  [personid] [nvarchar](40) NOT NULL,
  [roleid] [nvarchar](40) NOT NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[publishers]    Script Date: 2/25/2018 11:40:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[publishers](
  [id] [nvarchar](40) NOT NULL,
  [name] [nvarchar](75) NULL,
  [city] [nvarchar](50) NULL,
  [state] [nvarchar](10) NULL,
  [country] [nvarchar](50) NULL,
  [zipcode] [nvarchar](10) NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[roles]    Script Date: 2/25/2018 11:40:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[roles](
  [roleid] [nvarchar](40) NOT NULL,
  [roletitle] [nvarchar](25) NULL
) ON [PRIMARY]

GO
