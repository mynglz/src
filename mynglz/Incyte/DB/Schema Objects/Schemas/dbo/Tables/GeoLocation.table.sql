CREATE TABLE [dbo].[GeoLocation](
	[GeoLocationId] [int] NOT NULL,
	[Zipcode] [varchar](5) NOT NULL,
	[ZipCodeType] [varchar](8) NOT NULL,
	[City] [varchar](40) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[LocationType] [varchar](10) NULL,
	[Lat] [decimal](18, 0) NOT NULL,
	[Long] [decimal](18, 0) NOT NULL,
	Point geography null,
	[Xaxis] [float] NULL,
	[Yaxis] [float] NULL,
	[Zaxis] [float] NULL,
	[WorldRegion] [varchar](2) NULL,
	[Country] [varchar](2) NOT NULL,
	[LocationText] [varchar](30) NULL,
	[Location] [varchar](165) NULL,
	[BusinessOnboarded] BIT DEFAULT(0),
	CONSTRAINT [XPKGeoLocation] PRIMARY KEY CLUSTERED 
	(
		[ZipCode] DESC
	)
)

