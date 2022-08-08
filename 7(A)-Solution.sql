SELECT 
	FirstName, LastName 
FROM 
	[Customer]
WHERE 
	LastName LIKE 'S%'
ORDER BY 
	LastName DESC,FirstName DESC