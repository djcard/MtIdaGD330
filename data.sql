/****** Object:  Table [dbo].[books]    Script Date: 2/26/2018 9:32:09 AM ******/
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
/****** Object:  Table [dbo].[content]    Script Date: 2/26/2018 9:32:09 AM ******/
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
/****** Object:  Table [dbo].[genres]    Script Date: 2/26/2018 9:32:09 AM ******/
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
/****** Object:  Table [dbo].[genrestobooks]    Script Date: 2/26/2018 9:32:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genrestobooks](
	[isbn13] [nvarchar](13) NULL,
	[genreid] [nvarchar](40) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[passwords]    Script Date: 2/26/2018 9:32:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[passwords](
	[personid] [nvarchar](40) NOT NULL,
	[password] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[people]    Script Date: 2/26/2018 9:32:09 AM ******/
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
/****** Object:  Table [dbo].[persontorole]    Script Date: 2/26/2018 9:32:09 AM ******/
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
/****** Object:  Table [dbo].[publishers]    Script Date: 2/26/2018 9:32:09 AM ******/
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
/****** Object:  Table [dbo].[roles]    Script Date: 2/26/2018 9:32:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[roleid] [nvarchar](40) NOT NULL,
	[roletitle] [nvarchar](25) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[books] ON 

INSERT [dbo].[books] ([ISBN13], [title], [year], [isbn], [weight], [binding], [pages], [language], [publisher], [coverimage], [description], [rowid]) VALUES (N'12353456456', N'My Book is greater and has more pages.', NULL, NULL, NULL, N'', NULL, NULL, N'07867683-B940-33D7-5DF4BFABDB1F09DF', N'16.jpg', N'<p>This is the description for my book</p>
', 6)
INSERT [dbo].[books] ([ISBN13], [title], [year], [isbn], [weight], [binding], [pages], [language], [publisher], [coverimage], [description], [rowid]) VALUES (N'78-1477829387', N'The Nightingale - Revenge of the Singing', NULL, NULL, NULL, N'', NULL, NULL, N'B3E125E0-053A-AC9E-F794604818CF7F21', N'', N'', 1)
INSERT [dbo].[books] ([ISBN13], [title], [year], [isbn], [weight], [binding], [pages], [language], [publisher], [coverimage], [description], [rowid]) VALUES (N'9780062196200', N'Strong Poison2', 1995, N'', CAST(1 AS Numeric(18, 0)), N'', 0, N'', N'07867683-B940-33D7-5DF4BFABDB1F09DF', N'StrongPoison2.jpg', N'<p><strong>&ldquo;A model detective story&hellip;Fascinating.&rdquo;</strong><br />
&mdash;<em>New York Times</em></p>

<p>OMG OMG OMG OMG!!!!!</p>

<p>&nbsp;</p>

<p>The great <a href="https://en.wikipedia.org/wiki/Dorothy_L._Sayers" target="_blank">Dorothy L. Sayers</a> is considered by many to be the premier detective novelist of the Golden Age, and her dashing sleuth, Lord Peter Wimsey, one of mystery fiction&rsquo;s most enduring and endearing protagonists. Acclaimed author Ruth Rendell has expressed her admiration for Sayers&rsquo;s work, praising her &ldquo;great fertility of invention, ingenuity, and wonderful eye for detail.&rdquo; The Dorothy L. Sayers classic,&nbsp;<em>Strong Poison</em>, is now back in print with an introduction by Elizabeth George, herself a crime fiction master. In&nbsp;<em>Strong Poison</em>, Sayers introduces Harriet Vane, a mystery writer who is accused of poisoning her fianc&eacute; and must now join forces with Lord Peter to escape a murder conviction and the hangman&rsquo;s noose.&nbsp;</p>

<p>In Strong Poison, Lord Peter first meets Harriet Vane, an author of police fiction. The immediate problem is that she is on trial for her life, charged with murdering her former lover. If Lord Peter does not prove she is innocent, he will lose her before he even persuades her to accept his proposal of marriage. But all the clues point to Harriet as having given Philip Boyes the arsenic that killed him.</p>
', 2)
INSERT [dbo].[books] ([ISBN13], [title], [year], [isbn], [weight], [binding], [pages], [language], [publisher], [coverimage], [description], [rowid]) VALUES (N'9780062196540', N'Gaudy Night  (Lord Peter Wimsey Mystery Book 14)', 2015, N'0062196537', CAST(1 AS Numeric(18, 0)), N'', 544, N'', N'07867683-B940-33D7-5DF4BFABDB1F09DF', N'GaudyNight.jpg', N'<p>Gaudy Night (1935) is a mystery novel by Dorothy L. Sayers, the tenth in her popular series about aristocratic sleuth Lord Peter Wimsey, and the third featuring crime writer Harriet Vane.&nbsp;<br />
<br />
The dons of Harriet Vane&#39;s alma mater, the all-female Shrewsbury College, Oxford (a thinly veiled take on Sayers&#39; own Somerville College[1]), have invited her back to attend the much anticipated annual &#39;Gaudy&#39; celebrations. However, the mood turns sour when someone begins a series of malicious pranks including poison-pen messages, obscene graffiti, the destruction of a set of proofs and crafting vile effigies. Desperate to avoid a possible murder in college, Harriet eventually asks her old friend Wimsey to investigate.</p>
', 3)
INSERT [dbo].[books] ([ISBN13], [title], [year], [isbn], [weight], [binding], [pages], [language], [publisher], [coverimage], [description], [rowid]) VALUES (N'9780988262591', N'The Phoenix Project', NULL, N'', CAST(0 AS Numeric(18, 0)), NULL, 0, NULL, N'28EBADBB-0B17-1815-FBDF7023EE254B61', N'TPP.jpg', N'<p>Bill is an IT manager at Parts Unlimited. It&#39;s Tuesday morning and on his drive into the office, Bill gets a call from the CEO.&nbsp;<br />
<br />
The company&#39;s new IT initiative, code named Phoenix Project, is critical to the future of Parts Unlimited, but the project is massively over budget and very late. The CEO wants Bill to report directly to him and fix the mess in ninety days or else Bill&#39;s entire department will be outsourced.&nbsp;<br />
<br />
With the help of a prospective board member and his mysterious philosophy of The Three Ways, Bill starts to see that IT work has more in common with manufacturing plant work than he ever imagined. With the clock ticking, Bill must organize work flow streamline interdepartmental communications, and effectively serve the other business functions at Parts Unlimited.&nbsp;<br />
<br />
In a fast-paced and entertaining style, three luminaries of the DevOps movement deliver a story that anyone who works in IT will recognize. Readers will not only learn how to improve their own IT organizations, they&#39;ll never view IT the same way again.</p>
', 4)
INSERT [dbo].[books] ([ISBN13], [title], [year], [isbn], [weight], [binding], [pages], [language], [publisher], [coverimage], [description], [rowid]) VALUES (N'9781101984437', N'The Taking of K-129', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3015)
INSERT [dbo].[books] ([ISBN13], [title], [year], [isbn], [weight], [binding], [pages], [language], [publisher], [coverimage], [description], [rowid]) VALUES (N'9781564141771', N'Our leaders Have No Clue', NULL, NULL, NULL, NULL, NULL, NULL, N'28EBADBB-0B17-1815-FBDF7023EE254B61', N'OEHNC.jpg', N'<p>The inside information from a top Fortune 500 consultant as to why the &quot;fads of the month&quot;downsizing, reengineering, TQM, or you name itnever work. A close look at boards, executives, human resources, and other culprits who deserve to be told, &quot;You&#39;re not wearing any clothes!&quot;</p>
', 5)
INSERT [dbo].[books] ([ISBN13], [title], [year], [isbn], [weight], [binding], [pages], [language], [publisher], [coverimage], [description], [rowid]) VALUES (N'9781610394239', N'Master Thieves', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3018)
INSERT [dbo].[books] ([ISBN13], [title], [year], [isbn], [weight], [binding], [pages], [language], [publisher], [coverimage], [description], [rowid]) VALUES (N'9784279953173', N'Brain Games Sudoku', 2010, N'', CAST(0 AS Numeric(18, 0)), N'', 0, N'eng', N'', N'', N'', 2011)
SET IDENTITY_INSERT [dbo].[books] OFF
INSERT [dbo].[content] ([contentid], [title], [description]) VALUES (N'72D529E0-092C-EA6C-445ACC3C20CB4491', N'', N'')
INSERT [dbo].[content] ([contentid], [title], [description]) VALUES (N'A7EE957B-C14B-95E1-5D36844A4408C572', N'Store Information', N'<p>Read &#39;Dese Books is charming little shop that has every book you would want <strong>to read. At least every book </strong>WE want to read and since we have awesome judgement, you shouldn&#39;t want to read anything <strong>else</strong>! No really, it makes no sense. And we also have bagels frequently when Steve <em>remembers to bring them in.&nbsp;&trade;. </em>This is new content.</p>

<p>&nbsp;</p>

<p>Welcome to <a href="http://www.redsox.com">Spring 2016</a>!! Glad you&#39;re here.&nbsp;</p>

<p>&nbsp;</p>')
INSERT [dbo].[content] ([contentid], [title], [description]) VALUES (N'2143ECAD-0FEC-3E79-4920312EB06351BF', N'How to read books', N'<p>Read! Open them up and Flip pages as necessary.</p>')
INSERT [dbo].[content] ([contentid], [title], [description]) VALUES (N'91D5E37C-CFCA-6EBC-9C0D268160FED36C', N'About US', N'<p>&quot;Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...&quot;</p>

<p>&quot;There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...&quot;</p>

<p>You can edit it here.&nbsp;</p>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
')
INSERT [dbo].[genres] ([genreid], [genrename], [genredescription], [genreTEMP]) VALUES (N'056309BF-C534-0700-8028B2989FF2BE17', N'Fantasy', N'<p>Elves, goblins, dragons etc.&nbsp;</p>
', 6)
INSERT [dbo].[genres] ([genreid], [genrename], [genredescription], [genreTEMP]) VALUES (N'AA6D6980-E3EC-7EED-2AB44D9368DDB85E', N'Mystery', NULL, 1)
INSERT [dbo].[genres] ([genreid], [genrename], [genredescription], [genreTEMP]) VALUES (N'AA6D6981-F8E6-F683-74703DDB9CD5F031', N'Children''s', NULL, 2)
INSERT [dbo].[genres] ([genreid], [genrename], [genredescription], [genreTEMP]) VALUES (N'AA6D6982-95D8-4AFA-80037DE9616D309B', N'Classic', N'<p>Books that had stood the test of time</p>
', 3)
INSERT [dbo].[genres] ([genreid], [genrename], [genredescription], [genreTEMP]) VALUES (N'AE79CA2D-B2F8-3ACA-2B2490491AE6BC23', N'Management', NULL, 4)
INSERT [dbo].[genres] ([genreid], [genrename], [genredescription], [genreTEMP]) VALUES (N'erwerewrewr', N'Horror3', N'', 5)
INSERT [dbo].[genres] ([genreid], [genrename], [genredescription], [genreTEMP]) VALUES (N'hghghg', N'Technical', NULL, 9)
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'9780062196540', N'AA6D6981-F8E6-F683-74703DDB9CD5F031')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'9780062196540', N'AE79CA2D-B2F8-3ACA-2B2490491AE6BC23')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'9781564141771', N'AE79CA2D-B2F8-3ACA-2B2490491AE6BC23')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'78-1477829387', N'AA6D6982-95D8-4AFA-80037DE9616D309B')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'1111111111111', N'AA6D6981-F8E6-F683-74703DDB9CD5F031')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'78-1477829387', N'AA6D6980-E3EC-7EED-2AB44D9368DDB85E')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'9780062196540', N'AA6D6980-E3EC-7EED-2AB44D9368DDB85E')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'12353456456', N'AA6D6981-F8E6-F683-74703DDB9CD5F031')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'12353456456', N'erwerewrewr')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'9780062196200', N'AA6D6981-F8E6-F683-74703DDB9CD5F031')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'9780062196200', N'056309BF-C534-0700-8028B2989FF2BE17')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'9780062196200', N'erwerewrewr')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'9780988262591', N'AE79CA2D-B2F8-3ACA-2B2490491AE6BC23')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'9780988262591', N'hghghg')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'1234567890123', N'AA6D6981-F8E6-F683-74703DDB9CD5F031')
INSERT [dbo].[genrestobooks] ([isbn13], [genreid]) VALUES (N'9780812973464', N'0528F575-97D7-CE61-AEBC84B52567D3A9')
INSERT [dbo].[passwords] ([personid], [password]) VALUES (N'2EE8F67B-0906-7194-1E9A2940C2BF2C4A', N'333E0A1E27815D0CEEE55C473FE3DC93D56C63E3BEE2B3B4AEE8EED6D70191A3')
INSERT [dbo].[passwords] ([personid], [password]) VALUES (N'CC1391C5-FCB3-45AE-B346DD9E1B3A8865', N'333E0A1E27815D0CEEE55C473FE3DC93D56C63E3BEE2B3B4AEE8EED6D70191A3')
INSERT [dbo].[people] ([id], [title], [firstname], [lastname], [email], [isadmin], [personid]) VALUES (N'CC1391C5-FCB3-45AE-B346DD9E1B3A8865', NULL, N'Robert', N'Gilliam', N'robert@gd330.com', 1, NULL)
INSERT [dbo].[people] ([id], [title], [firstname], [lastname], [email], [isadmin], [personid]) VALUES (N'2EE8F67B-0906-7194-1E9A2940C2BF2C4A', NULL, N'Dylan', N'Lasname', N'dylan@gd330.com', 1, N'5555555   ')
INSERT [dbo].[persontorole] ([bookid], [personid], [roleid]) VALUES (N'12353456456', N'8C87F24A-022C-BAA7-1F6442A5AD44CD86', N'1')
INSERT [dbo].[persontorole] ([bookid], [personid], [roleid]) VALUES (N'12353456456', N'8C87F24A-022C-BAA7-1F6442A5AD44CD86', N'4')
INSERT [dbo].[publishers] ([id], [name], [city], [state], [country], [zipcode]) VALUES (N'07867683-B940-33D7-5DF4BFABDB1F09DF', N'Harper Collins', N'New York City', N'NY', N'USA', NULL)
INSERT [dbo].[publishers] ([id], [name], [city], [state], [country], [zipcode]) VALUES (N'1', N'Andrews McMeel Publishing', NULL, NULL, NULL, NULL)
INSERT [dbo].[publishers] ([id], [name], [city], [state], [country], [zipcode]) VALUES (N'2', N'Publications Limited inc.', NULL, NULL, NULL, NULL)
INSERT [dbo].[publishers] ([id], [name], [city], [state], [country], [zipcode]) VALUES (N'28EBADBB-0B17-1815-FBDF7023EE254B61', N'IT REV', NULL, NULL, NULL, NULL)
INSERT [dbo].[publishers] ([id], [name], [city], [state], [country], [zipcode]) VALUES (N'B3E125E0-053A-AC9E-F794604818CF7F21', N'Doubleday', NULL, NULL, NULL, NULL)
INSERT [dbo].[roles] ([roleid], [roletitle]) VALUES (N'1', N'Author')
INSERT [dbo].[roles] ([roleid], [roletitle]) VALUES (N'2', N'Editor')
INSERT [dbo].[roles] ([roleid], [roletitle]) VALUES (N'3', N'Proofreader')
INSERT [dbo].[roles] ([roleid], [roletitle]) VALUES (N'4', N'Illustrator')
