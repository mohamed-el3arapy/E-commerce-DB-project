START TRANSACTION;
SELECT stock_quantity 
FROM Product 
WHERE product_id = 101 
FOR UPDATE;
COMMIT;
