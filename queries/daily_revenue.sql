SELECT 
    order_date AS 'Date', 
    SUM(total_amount) AS 'Total amount',
    COUNT(order_id) AS 'Number of orders'
FROM `Order`
WHERE order_date = '2024-04-10' 
GROUP BY order_date;
