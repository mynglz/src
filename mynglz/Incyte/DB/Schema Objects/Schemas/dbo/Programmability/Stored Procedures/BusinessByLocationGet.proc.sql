CREATE PROCEDURE BusinessByLocationGet
	@latitude decimal(18,14),
	@longitude decimal(18,14),
	@distance int
AS
BEGIN

declare @pointTo geography = geography::Point(@latitude,@longitude, 4326);

SELECT * FROM Business WHERE GeoLocationId in
(
	SELECT GeoLocationId FROM GeoLocation WHERE
	BusinessOnboarded = 1
	AND 
		(Point IS NOT NULL AND point.STDistance(@pointTo)/1609.344 <= @distance)
)

END