--  1. Create data on delivery dates return policy and make datediffers

-- CREATE TABLE orders (
--     order_id INT PRIMARY KEY,
--     product_name VARCHAR(100),
--     delivery_date DATE,
--     return_days INT,        
--     returnable BOOLEAN     
-- );


-- INSERT INTO orders (order_id, product_name, delivery_date, return_days, returnable)
-- VALUES
-- (1, 'Laptop',        '2025-06-01', 10, 1),
-- (2, 'Mobile Phone',  '2025-06-10', 7, 1),
-- (3, 'Headphones',    '2025-06-12', 5, 0),
-- (4, 'Smartwatch',    '2025-06-08', 15, 1),
-- (5, 'Monitor',       '2025-06-14', 0, 0);


SELECT order_id, product_name, delivery_date, DATEDIFF(NOW(), delivery_date) AS days_since_delivery FROM orders;


+----------+--------------+---------------+---------------------+
| order_id | product_name | delivery_date | days_since_delivery |
+----------+--------------+---------------+---------------------+
|        1 | Laptop       | 2025-06-01    |                  13 |
|        2 | Mobile Phone | 2025-06-10    |                   4 |
|        3 | Headphones   | 2025-06-12    |                   2 |
|        4 | Smartwatch   | 2025-06-08    |                   6 |
|        5 | Monitor      | 2025-06-14    |                   0 |
+----------+--------------+---------------+---------------------+


SELECT
    order_id,
    product_name,
    delivery_date,
    return_days,
    returnable,
    CASE
        WHEN returnable = 1 THEN
            GREATEST(return_days - DATEDIFF(NOW(), delivery_date), 0)
        ELSE
            NULL
    END AS days_left_to_return
FROM orders;

+----------+--------------+---------------+-------------+------------+---------------------+
| order_id | product_name | delivery_date | return_days | returnable | days_left_to_return |
+----------+--------------+---------------+-------------+------------+---------------------+
|        1 | Laptop       | 2025-06-01    |          10 |          1 |                   0 |
|        2 | Mobile Phone | 2025-06-10    |           7 |          1 |                   3 |
|        3 | Headphones   | 2025-06-12    |           5 |          0 |                NULL |
|        4 | Smartwatch   | 2025-06-08    |          15 |          1 |                   9 |
|        5 | Monitor      | 2025-06-14    |           0 |          0 |                NULL |
+----------+--------------+---------------+-------------+------------+---------------------+