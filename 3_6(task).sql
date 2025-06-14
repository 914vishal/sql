-- 1. Create three triggers: one for INSERT, one for UPDATE, and one for DELETE. 
-- Create one  dependency table and add a record to that table with the message "Data added" when a record is inserted, 
-- "Data updated" when a record is updated, and "Data deleted" when a record is deleted.


-- AFTER INSERT Trigger

DELIMITER $$
CREATE TRIGGER trg_after_insert_demo_data
AFTER INSERT ON demo_data
FOR EACH ROW
BEGIN
    INSERT INTO dependency_log (log_message)
    VALUES (
        CONCAT('Inserted: ID=', NEW.id, ', Name=', NEW.name)
    );
END$$
DELIMITER ;


-- AFTER UPDATE Trigger

DELIMITER $$
CREATE TRIGGER trg_after_update_demo_data
AFTER UPDATE ON demo_data
FOR EACH ROW
BEGIN
    INSERT INTO dependency_log (log_message)
    VALUES (
        CONCAT(
            'Updated: ID=', NEW.id,
            ', Name changed from ''', OLD.name, ''' to ''', NEW.name, ''''
        )
    );
END$$
DELIMITER ;


-- AFTER DELETE Trigger

DELIMITER $$
CREATE TRIGGER trg_after_delete_demo_data
AFTER DELETE ON demo_data
FOR EACH ROW
BEGIN
    INSERT INTO dependency_log (log_message)
    VALUES (
        CONCAT('Deleted: ID=', OLD.id, ', Name=', OLD.name)
    );
END$$
DELIMITER ;


INSERT INTO demo_data (id, name, email, age, phone, city, country, status, created_at, updated_at)
VALUES (102, 'LogTest', 'logtest@example.com', 30, '+91-9999999999', 'Hyderabad', 'India', 'Active', NOW(), NOW());

UPDATE demo_data SET name = 'LogTestUpdated' WHERE id = 101;

DELETE FROM demo_data WHERE id = 101;

SELECT * FROM dependency_log;

-- o/p:-

+----+--------------------------------------------------------------------+---------------------+
| id | log_message                                                        | log_time            |
+----+--------------------------------------------------------------------+---------------------+
|  1 | Inserted: ID=102, Name=LogTest                                     | 2025-06-14 19:17:47 |
|  2 | Updated: ID=101, Name changed from 'Test User' to 'LogTestUpdated' | 2025-06-14 19:17:51 |
|  3 | Deleted: ID=101, Name=LogTestUpdated                               | 2025-06-14 19:17:55 |
+----+--------------------------------------------------------------------+---------------------+