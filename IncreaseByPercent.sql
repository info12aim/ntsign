--UpdatePriceByPercent - Update All Products Price By Percentage
ALTER procedure [dbo].[UpdatePriceByPercent] 
(
  @PERCENTAGE decimal(18,4)
)
as  
begin  
	Declare @newpercent decimal(18,4)
	set @newpercent = @Percentage/100
	--print @newpercent
	Update Product
	set Price = Price + (Price * @newpercent)
END

----Update Price by Value
CREATE procedure [dbo].[UpdatePriceByValue] 
(
  @Value decimal(18,4)
)
as  
begin  
	Update Product
	set Price = Price + @Value
END

--GetPriceWithID - Gell Selected Records from Product Table To Display
Alter procedure [dbo].[GetPriceWithID] 
as  
begin  
	Select Id,Name,Sku,Price from Product
END

--GetCategoryName - Gets the Category Name from Category Table for displaying it in Textbox 
ALTER procedure [dbo].[GetCategoryName] 
as  
begin  
	Select ID,Name,ParentCategoryId from Category where Id not in (1)
END

--GetCategoryByID - Gets ID of Category from mapping table 
ALTER procedure [dbo].[GetCategoryByID] 
(
 @CategoryID int
)
as  
begin  
	Select CategoryId,ProductId from Product_Category_Mapping where CategoryID = @CategoryID
END

Exec GetCategoryName


--CheckProductsForCategory - To check if Products exists or not
ALTER procedure [dbo].[CheckProductsForCategory] 
(
 @CategoryID int
)
as  
begin  
	 Select top 1 CategoryId,c.Name from 
	 Product_Category_Mapping pc join Product p 
	 on pc.ProductId = p.Id 
	 join Category c 
	 on pc.CategoryId = c.Id
	 where CategoryId = @CategoryID
END



--UpdateIncreasePriceByCategory Updates Products Price By Category
ALTER procedure [dbo].[UpdateIncreasePriceByCategory] 
(
  @CategoryID int,
  @PERCENTAGE decimal(18,4)
)
as  
begin 
Declare @newpercent decimal(18,4)
set @newpercent = @PERCENTAGE/100

UPDATE p
SET Price = Price + (Price * @newpercent)
FROM Product p
JOIN Product_Category_Mapping pc
    ON pc.ProductId = p.Id
WHERE CategoryId = @CategoryID

 --Select CategoryId,ProductId,Price from 
 --Product_Category_Mapping pc join Product p 
 --on pc.ProductId = p.Id where CategoryId = 5

END

------------------------

Create procedure [dbo].[GetAllParentCategories]
(
 @ParentCategoryId int
)
as
begin
with
nopC
as
(
SELECT [Id]
      ,[Name]
      --,CAST(([Name]) AS VARCHAR(1000)) AS "Path"
	  ,[ParentCategoryId]
  FROM [dbo].[Category]
  where ParentCategoryId = @ParentCategoryId
  union all
SELECT t.[Id]
      ,t.[Name]
     -- , CAST((a.path + ' (' + cast(a.Id as varchar(50)) + ')  ' + '--> ' + t.Name +   ' (' + cast(t.Id as varchar(4)) + ')' )  AS VARCHAR(1000)) AS "Path"
	    ,t.[ParentCategoryId]
  FROM [dbo].[Category] t
  join nopc as a
  on t.parentcategoryid = a.id)
  select * from nopC order by ParentCategoryId
  --order by path
End

-----------------------------------------




--exec UpdatePriceByPercent 20

--SELECT Id,Price FROM Product_bkp_price 
--79.1000 80.682 96.8184

--select (Price * (2/100)) as price2 FROM Product_bkp_price 

--Update Product_bkp_price    
--	set Price = 79.1000 where Id = 1

--drop procedure UpdatePriceByPercent
--select * into Product_Price_Dump from Product

select * from Category
select * from Product
select * from Product_Category_Mapping where CategoryId = 5
select * from store

update store set URL = '',SecureUrl = '',Hosts = '', CompanyName = '', CompanyAddress = '' where Id = 1


Select CategoryId,ProductId from Product_Category_Mapping where CategoryId = 5

 Select CategoryId,ProductId,Price from 
 Product_Category_Mapping pc join Product p 
 on pc.ProductId = p.Id where CategoryId = 6

 select * from Category where ParentCategoryId = 4

Declare @CategoryID int
set @CategoryID = 4
  SELECT *
    FROM dbo.Category
    WHERE ID = Case When @CategoryID = 0 Then ID Else @CategoryID End
    --UNION ALL
    SELECT *
    FROM Category AS Child INNER JOIN Category AS Parent
        ON Child.ParentCategoryId = Parent.Id

 	 Select * from 
	 Product_Category_Mapping pc join Product p 
	 on pc.ProductId = p.Id 
	 join Category c 
	 on pc.CategoryId = c.Id
	 where c.ParentCategoryId = 4

-------------------------------------------------------------------------------------------------
ALTER procedure [dbo].[GetAllParentCategories]
(
 @ParentCategoryId int
)
as
begin
with
nopC
as
(
SELECT [Id]
      ,[Name]
      --,CAST(([Name]) AS VARCHAR(1000)) AS "Path"
	  ,[ParentCategoryId]
  FROM [dbo].[Category]
  where ParentCategoryId = @ParentCategoryId
  union all
SELECT t.[Id]
      ,t.[Name]
     -- , CAST((a.path + ' (' + cast(a.Id as varchar(50)) + ')  ' + '--> ' + t.Name +   ' (' + cast(t.Id as varchar(4)) + ')' )  AS VARCHAR(1000)) AS "Path"
	    ,t.[ParentCategoryId]
  FROM [dbo].[Category] t
  join nopc as a
  on t.parentcategoryid = a.id)
  select * from nopC order by ParentCategoryId
  --order by path
End
GO
---------------------------------------------------
--Update Price
ALTER procedure [dbo].[UpdateIncreasePriceNewCategoryWise] 
(
  --@CategoryID int,
  @PERCENTAGE decimal(18,4),
  @ParentCategoryId int
)
as  
begin 
Declare @newpercent decimal(18,4)
set @newpercent = @PERCENTAGE/100;

with
nopC
as
(
SELECT  [Id]
      ,[Name]
	  ,[ParentCategoryId]
  FROM [dbo].[Category]
  where ParentCategoryId = @ParentCategoryId
  union all
SELECT t.[Id]
      ,t.[Name]
      ,t.[ParentCategoryId]
  FROM [dbo].[Category] t
  join nopc as a
  on t.parentcategoryid = a.id)

  UPDATE p
	SET Price = Price + (Price * @newpercent)
	from nopC n
	left  join Product_Category_Mapping pc 
	on n.Id = pc.CategoryId
	left join Product P
	on pc.ProductId = p.Id
	where P.Id is not null 

END

--------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[GetProductsPageWise]
      @SearchTerm VARCHAR(100) =''
      ,@PageIndex INT = 1
      ,@PageSize INT = 10
      ,@RecordCount INT OUTPUT
AS
BEGIN
      SET NOCOUNT ON;
      SELECT ROW_NUMBER() OVER
      (
            ORDER BY [Id]ASC
      )AS RowNumber
             ,[Id]
             ,[Name]
             ,[Sku]
             ,[Price]
      INTO #Results
      FROM [Product]
      WHERE [Name]LIKE @SearchTerm +'%' OR @SearchTerm =''
     
      SELECT @RecordCount =COUNT(*)
      FROM #Results
           
      SELECT *
      FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
     
      DROP TABLE #Results
END

--------------------------------------------------------------------------
CREATE procedure [dbo].[GetSubCategories] 
(
	@ParentCategoryId INT
)
as  
begin  
	SELECT * FROM CATEGORY WHERE ParentCategoryId = @ParentCategoryId
END

-----------------------------------------------------------------------------------------
CREATE procedure [dbo].[GetMainCategories] 
as  
begin  
	SELECT * FROM CATEGORY WHERE ParentCategoryId = 1
END

------------------------------------------------------------------------------------------

CREATE procedure [dbo].[CheckParentCategory] 
(
	@ParentCategoryId INT
)
as  
begin  
	SELECT * FROM CATEGORY WHERE ParentCategoryId = @ParentCategoryId
END

 --------------------------------------------------------------------
 CREATE procedure [dbo].[UpdateIncreaseValuePriceByCategory] 
(
  --@CategoryID int,
  @Value decimal(18,4),
  @ParentCategoryId int
)
as  
begin 


with
nopC
as
(
SELECT  [Id]
      ,[Name]
	  ,[ParentCategoryId]
  FROM [dbo].[Category]
  where ParentCategoryId = @ParentCategoryId
  union all
SELECT t.[Id]
      ,t.[Name]
      ,t.[ParentCategoryId]
  FROM [dbo].[Category] t
  join nopc as a
  on t.parentcategoryid = a.id)

  UPDATE p
	SET Price = Price + @Value
	from nopC n
	left  join Product_Category_Mapping pc 
	on n.Id = pc.CategoryId
	left join Product P
	on pc.ProductId = p.Id
	where P.Id is not null 

END
----------------------------------------------------------------------------------------------------------
--Update Price decrease
CREATE procedure [dbo].[UpdateDecreasePriceNewCategoryWise] 
(
  --@CategoryID int,
  @PERCENTAGE decimal(18,4),
  @ParentCategoryId int
)
as  
begin 
Declare @newpercent decimal(18,4)
set @newpercent = @PERCENTAGE/100;

with
nopC
as
(
SELECT  [Id]
      ,[Name]
	  ,[ParentCategoryId]
  FROM [dbo].[Category]
  where ParentCategoryId = @ParentCategoryId
  union all
SELECT t.[Id]
      ,t.[Name]
      ,t.[ParentCategoryId]
  FROM [dbo].[Category] t
  join nopc as a
  on t.parentcategoryid = a.id)

  UPDATE p
	SET Price = Price - (Price * @newpercent)
	from nopC n
	left  join Product_Category_Mapping pc 
	on n.Id = pc.CategoryId
	left join Product P
	on pc.ProductId = p.Id
	where P.Id is not null 

END


 --------------------------------------------------------------------
 CREATE procedure [dbo].[UpdateDecreaseValuePriceByCategory] 
(
  --@CategoryID int,
  @Value decimal(18,4),
  @ParentCategoryId int
)
as  
begin 


with
nopC
as
(
SELECT  [Id]
      ,[Name]
	  ,[ParentCategoryId]
  FROM [dbo].[Category]
  where ParentCategoryId = @ParentCategoryId
  union all
SELECT t.[Id]
      ,t.[Name]
      ,t.[ParentCategoryId]
  FROM [dbo].[Category] t
  join nopc as a
  on t.parentcategoryid = a.id)

  UPDATE p
	SET Price = Price - @Value
	from nopC n
	left  join Product_Category_Mapping pc 
	on n.Id = pc.CategoryId
	left join Product P
	on pc.ProductId = p.Id
	where P.Id is not null 

END


--------------------------------------------------------------
--Testing
 Select CategoryId,ProductId,Price from Category c join 
 Product_Category_Mapping pc on
 c.Id = pc.CategoryID
 join Product p 
 on pc.ProductId = p.Id where c.ID = 161

 Select CategoryId,ProductId,Price from Category c join 
 Product_Category_Mapping pc on
 c.Id = pc.CategoryID
 join Product p 
 on pc.ProductId = p.Id where c.ParentCategoryId = 161

 Select Id,Name,Sku,Price from Product

 ----Decrease Price by Value
CREATE procedure [dbo].[UpdatePriceDecreaseByValue] 
(
  @Value decimal(18,4)
)
as  
begin  
	Update Product
	set Price = Price - @Value
END

--UpdatePriceByPercent - Decrease All Products Price By Percentage
CREATE procedure [dbo].[UpdatePriceDecreaseByPercent] 
(
  @PERCENTAGE decimal(18,4)
)
as  
begin  
	Declare @newpercent decimal(18,4)
	set @newpercent = @Percentage/100
	--print @newpercent
	Update Product
	set Price = Price - (Price * @newpercent)
END

