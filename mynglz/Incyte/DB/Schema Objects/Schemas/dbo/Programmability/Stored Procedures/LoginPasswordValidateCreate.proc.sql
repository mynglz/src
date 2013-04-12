CREATE PROCEDURE LoginPasswordValidateCreate
	@UserName	nvarchar(255) = NULL,
	@UserPassword nvarchar(20) = NULL
AS
BEGIN
	DECLARE @UserID INT

	IF NOT EXISTS (SELECT TOP 1 * FROM UserLogin (NOLOCK) WHERE externalidCheckSum = HASHBYTES('MD5',@UserName) AND UserName = @UserName)
	BEGIN
		INSERT INTO dbo.UserLogin
		(
			UserName
			,UserPassword
			,ExternalId
			,SourceID
			,ExternalIdCheckSum
			,LastLoginDateTime
			,CreatedDtTm
			,CreatedBy
			,Disabled
		)
		VALUES
		(
			@UserName
			,HASHBYTES('MD5',@UserPassword)
			,0
			,0
			,HASHBYTES('MD5',@UserName)
			,GETUTCDATE()
			,GETUTCDATE()
			,'system'
			,0
		)
		
		SELECT @UserID = @@IDENTITY
		
		
		INSERT INTO UserCheckIn
		(UserID)
		SELECT @UserID
		
		SELECT 
			Userid
			,UserName
			,UserPassword
			,ExternalId
			,SourceID
			,ExternalIdCheckSum
			,LastLoginDateTime
			,CreatedDtTm
			,CreatedBy
			,Disabled
			,'true' AS IsNEW
			,'false' AS 'Exists'
		FROM UserLogin (NOLOCK)
		WHERE Userid = @UserID
	END
	ELSE
	BEGIN
		
		SELECT 
			0 Userid
			,''	UserName
			,''	UserPassword
			,''	ExternalId
			,''	SourceID
			,''	ExternalIdCheckSum
			,''	LastLoginDateTime
			,GETUTCDATE() CreatedDtTm
			,''	CreatedBy
			,0	Disabled
			,'false' AS IsNEW
			,'true' AS 'Exists'
	END

END
