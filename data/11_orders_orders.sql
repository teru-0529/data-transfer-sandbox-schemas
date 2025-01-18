-- operation_afert_create_tables

-- 1.受注(orders)

-- Set FK Constraint
ALTER TABLE orders.orders DROP CONSTRAINT IF EXISTS orders_foreignKey_1;
ALTER TABLE orders.orders ADD CONSTRAINT orders_foreignKey_1 FOREIGN KEY (
  order_pic
) REFERENCES orders.operators (
  operator_id
);
