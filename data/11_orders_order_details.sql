-- operation_afert_create_tables

-- 2.受注明細(order_details)

-- Set FK Constraint
ALTER TABLE orders.order_details DROP CONSTRAINT IF EXISTS order_details_foreignKey_1;
ALTER TABLE orders.order_details ADD CONSTRAINT order_details_foreignKey_1 FOREIGN KEY (
  order_no
) REFERENCES orders.orders (
  order_no
) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE orders.order_details DROP CONSTRAINT IF EXISTS order_details_foreignKey_2;
ALTER TABLE orders.order_details ADD CONSTRAINT order_details_foreignKey_2 FOREIGN KEY (
  product_id
) REFERENCES orders.products (
  product_id
);
