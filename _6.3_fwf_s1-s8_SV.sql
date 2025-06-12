1. 2. 3--Q: How to extract firts name contact name?
--A Well, here is your problem...
--CustomerName = Alejandra Camino -> Alejandra


Select t.ContactName
	From dbo.t_w3_schools_customers AS t
  Order by 1;


4--Q: How to extract firts name contact name?
--A Well, here is your problem...
--CustomerName = Alejandra Camino -> Alejandra
--Google search 'how to extrac first name from combinaed name tsql stack overflow'
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name



Select t.ContactName
	  , LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') -1) AS first_name
	From dbo.t_w3_schools_customers AS t
  Order by 1;


5
CREATE FUNcTION [dbo].[udf_parse_first_name]
(@v_combined_name AS VARCHAR(500)
)
RETURNS VARCHAR(100)

/***********************************************************************************************
NAME: dbo.udf_parse_firt_name
PURPOSE: Parse First Name from combined name

MODIFICATION LOG:
Ver    Date      Author      Description
----- --------- ----------- ---------------------------------------------------------------------
1.0    06/04/2022 JJAUSSI      1. Built this script for EC IT440

RUNTIME:
1s

NOTES:
Adapted from the following...
https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

****************************************************************************************************/

		BEGIN
			DECLARE @v_first_name AS varchar(100);
			SET @v_first_name = LEFT(@v_combined_name, CHARINDEX(' ', @V_combined_name + ' ') -1);
			RETURN @v_first_name;
		END;
   GO


6--Q: How to extract firts name contact name?
--A Well, here is your problem...
--CustomerName = Alejandra Camino -> Alejandra
--Google search 'how to extrac first name from combinaed name tsql stack overflow'
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name



Select t.ContactName
	  , LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') -1) AS first_name
	  ,dbo.udf_parse_first_name(t.ContactName) AS first_name2
	From dbo.t_w3_schools_customers AS t
  Order by 1;



7--Q: How to extract firts name contact name?
--A Well, here is your problem...
--CustomerName = Alejandra Camino -> Alejandra
--Google search 'how to extrac first name from combinaed name tsql stack overflow'
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

With s1 --use a common Table Expressin and compare first_name to first_name

  AS (Select t.ContactName
	  , LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') -1) AS first_name
	  ,dbo.udf_parse_first_name(t.ContactName) AS first_name2
	From dbo.t_w3_schools_customers AS t)
  Select s1.*
    From s1
   Where s1.first_name <> s1.first_name2; --expected result is  rows



8--Q: How to extract firts name contact name?
--A Well, here is your problem...
--CustomerName = Alejandra Camino -> Alejandra
--Google search 'how to extrac first name from combinaed name tsql stack overflow'
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

  SELECT t.CustomerID
		, t.CustomerName
		, t.ContactName
	    , dbo.udf_parse_first_name(t.ContactName) AS ContactName_first_name
	    , '' AS ContactName_last_name --How to extract last from contact Name?
	    , t.Address
	    , t.City
	    , t.Country
     FROM dbo.t_w3_schools_customers AS t
    ORDER BY 3;

