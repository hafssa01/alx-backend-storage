-- Create a trigger to decrease item quantity after an order is inserted
DELIMITER $$

CREATE TRIGGER after_insert_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    -- Update the items table to decrease the quantity of the ordered item
    UPDATE items
    SET quantity = quantity - NEW.number
    WHERE name = NEW.item_name;
END $$

DELIMITER ;
