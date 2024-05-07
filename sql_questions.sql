SELECT stockcode, SUM(quantity * unitprice)
FROM practice_tables.retail_data
GROUP BY stockcode
ORDER BY SUM(quantity * unitprice) desc
limit 5