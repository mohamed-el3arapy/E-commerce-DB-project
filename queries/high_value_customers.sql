SELECT 
    Customer.first_name, 
    Customer.last_name, 
    SUM(`Order`.total_amount) AS total_spent
FROM Customer
JOIN `Order` ON Customer.customer_id = `Order`.customer_id
WHERE `Order`.order_date >= '2024-04-01' AND `Order`.order_date <= '2024-04-30'
GROUP BY Customer.customer_id, Customer.first_name, Customer.last_name
HAVING SUM(`Order`.total_amount) > 500;
