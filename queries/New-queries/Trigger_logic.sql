CREATE TRIGGER After_Order_details_Insert
AFTER INSERT ON Order_details
FOR EACH ROW
    INSERT INTO Sale_History (order_date, customer_name, product_name, total_amount, quantity)
    SELECT 
        o.order_date,
        CONCAT(c.first_name, ' ', c.last_name),
        p.name,
        (NEW.unit_price * NEW.quantity),
        NEW.quantity
    FROM `orders` o
    JOIN customer c ON o.customer_id = c.customer_id
    JOIN product p ON p.product_id = NEW.product_id
    WHERE o.order_id = NEW.order_id;
