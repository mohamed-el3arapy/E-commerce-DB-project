SELECT 
    p.name AS 'Product name',
    SUM(od.quantity) AS 'Total quantity sold',
    SUM(od.quantity * od.unit_price) AS 'Total sales'
FROM Order_details od
JOIN Product p ON od.product_id = p.product_id
JOIN `Order` o ON od.order_id = o.order_id
WHERE o.order_date BETWEEN '2024-04-01' AND '2024-04-30'
GROUP BY p.product_id, p.name
ORDER BY SUM(od.quantity) DESC;
