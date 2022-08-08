WITH cte_customer_order_value(CustomerID,OrderValue) AS (
	SELECT 
		CustomerID,CONCAT('$',SUM(Cost*Quantity)) net_value
	FROM 
		[OrderLine] 
	JOIN
		[Order] ON OrderID = OrdID
	WHERE 
		OrderDate > DATEADD(m, -6, GetDate())
	GROUP BY
		CustomerID
	HAVING SUM(Cost*Quantity) BETWEEN 100 and 500 
)
SELECT 
	CustID, FirstName,LastName, COALESCE(OrderValue,'$0') OrderValue 
FROM
	[Customer]
INNER JOIN 
	cte_customer_order_value ON CustID = CustomerID
ORDER BY 
	LastName DESC,FirstName DESC
