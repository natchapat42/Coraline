CREATE TABLE cat_reg AS (SELECT "category",
	-- for FLOOR (>0.5) and CEIL(<0.5) DATA
	CASE WHEN SUM("east") - FLOOR(SUM("east")) > 0.5 THEN CEIL(SUM("east")) ELSE FLOOR(SUM("east")) END AS "east",
	CASE WHEN SUM("west") - FLOOR(SUM("west")) > 0.5 THEN CEIL(SUM("west")) ELSE FLOOR(SUM("west")) END AS "west",
	CASE WHEN SUM("east" + "west") - FLOOR(SUM("east" + "west")) > 0.5 THEN CEIL(SUM("east" + "west")) ELSE FLOOR(SUM("east" + "west")) END AS "GrandTotal" 
FROM (
	-- for pivot table
	SELECT * FROM crosstab( 
    'SELECT "Category", "Region", 
	SUM("TotalPrice")
	FROM food_sales GROUP BY "Category", "Region" ORDER BY 1,2'
) AS pivot(Category character varying, East double precision, West double precision)
) AS pivot GROUP BY "category" ORDER BY "category");

-- Show table
SELECT * FROM cat_reg

