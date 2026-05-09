SELECT 
    p.name AS Recommended_Product, 
    p.price, 
    c.category_name
FROM Product p
JOIN Category c ON p.category_id = c.category_id
WHERE p.category_id = (SELECT category_id FROM Product WHERE product_id = 101)
  AND p.product_id <> 101
ORDER BY p.stock_quantity DESC;
