CREATE TABLE [dbo].[UserCheckInHistory](
	[UserID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL ,
	[EndTime] [datetime] NOT NULL  ,
	CheckinCount INT DEFAULT(0),
	[UpdatedDtTm] [datetime] NOT NULL,
	[UpdatedBy] [varchar](20) NULL,
	[BusinessId] [int] NOT NULL,
	[IsSponsored] tinyint DEFAULT(0),
	[CheckinID] [int] NOT NULL IDENTITY(1,1),
 CONSTRAINT [XPKBusinessCheckInHistory] PRIMARY KEY CLUSTERED 
(
	[CheckinID] ASC
)
)