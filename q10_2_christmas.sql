WITH start AS (
	SELECT ProductName as Name, Product.Id AS id
	FROM Product 
	WHERE Id IN 
		(SELECT DISTINCT(ProductId) FROM OrderDetail WHERE OrderId IN 
		 	(SELECT Id FROM 'Order' WHERE CustomerId IN 
			 	(SELECT Id FROM Customer WHERE CompanyName = "Queen Cozinha") 
			 AND OrderDate like "2014-12-25%")
		) 
	ORDER BY Id ASC
),
sort_list AS (
	SELECT row_number() over (ORDER BY start.id ASC) AS seqnum, start.name AS name
	from start
),
ans AS (
	SELECT seqnum, name
	FROM sort_list
	WHERE seqnum = 1
	UNION ALL
	SELECT sort_list.seqnum, a.name || ', ' || sort_list.name
	FROM sort_list JOIN
		ans AS a ON sort_list.seqnum = a.seqnum + 1
)
SELECT name FROM ans ORDER BY seqnum desc LIMIT 1;