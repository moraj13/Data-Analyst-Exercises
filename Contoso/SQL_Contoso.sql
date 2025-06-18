CREATE VIEW Project
AS
SELECT TOP 5000 
	FS.SalesKey,
	FS.DateKey,
	FS.ProductKey,
	FS.UnitPrice,
	FS.DiscountQuantity,
	FS.DiscountAmount,
	FS.TotalCost,
	FS.SalesQuantity,
	FS.SalesAmount,
	DC.ChannelName,
	DS.StoreName,
	DG.RegionCountryName
FROM FactSales AS FS
INNER JOIN DimChannel AS DC
		ON FS.channelKey = DC.ChannelKey
INNER JOIN DimStore AS DS
		ON FS.StoreKey = DS.StoreKey
INNER JOIN DimGeography AS DG
		ON DS.GeographyKey = DG.GeographyKey

CREATE VIEW Pro_data
AS
SELECT 
	P.SalesKey,
	P.DateKey,
	P.DiscountQuantity,
	P.DiscountAmount,
	P.TotalCost,
	P.SalesQuantity,
	P.SalesAmount,
	P.ChannelName,
	P.StoreName,
	P.RegionCountryName,
	DPS.[ProductSubcategoryName]
FROM Project AS P
INNER JOIN dbo.DimProduct AS DP
		ON P.ProductKey = DP.ProductKey
INNER JOIN DBO.DimProductSubcategory AS DPS
		ON DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey

SELECT * FROM Pro_data

