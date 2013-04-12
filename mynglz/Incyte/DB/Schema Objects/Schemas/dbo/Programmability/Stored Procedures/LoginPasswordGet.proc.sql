CREATE PROCEDURE LoginPasswordGet
	@UserName	nvarchar(255) = NULL,
	@UserPassword nvarchar(20) = NULL
AS
BEGIN
	
	SELECT * FROM UserLogin (NOLOCK) WHERE externalidCheckSum = HASHBYTES('MD5',@UserName) AND UserName = @UserName AND UserPassword = HASHBYTES('MD5',@UserPassword)

END
