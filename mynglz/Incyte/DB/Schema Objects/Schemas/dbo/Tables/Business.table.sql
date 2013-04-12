CREATE TABLE [dbo].[Business]
(
	[BusinessId] [int] NOT NULL IDENTITY(1,1),
	[ExternalId] varchar (30) NOT NULL,
	GenderMCheckIns	INT	NOT NULL DEFAULT(0),
	GenderFCheckIns	INT	NOT NULL DEFAULT(0),
	SourceId	INT NULL,
	[ExternalIdCheckSum] varbinary(100) NOT NULL,
	LastDateCheckin [datetime] NULL ,
	[Zipcode] [varchar](5) NULL,
	BusinessName [nvarchar](255) NULL,
	City	[nvarchar](40) NULL,
	GeoLocationId int  null,
	[UpdatedDtTm] [datetime] NULL DEFAULT(GETUTCDATE()),
	[UpdatedBy] [varchar](80) NULL,
 CONSTRAINT [XPKBusiness] PRIMARY KEY CLUSTERED 
(
	[BusinessId] ASC
)
)
