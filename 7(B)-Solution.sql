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
)
SELECT 
	CustID, FirstName,LastName, COALESCE(OrderValue,'$0') OrderValue 
FROM
	[Customer]
LEFT JOIN 
	cte_customer_order_value ON CustID = CustomerID
ORDER BY 
	LastName DESC,FirstName DESC