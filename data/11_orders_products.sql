-- operation_afert_create_tables

-- 3.商品(products)

-- Set FK Constraint
ALTER TABLE orders.products DROP CONSTRAINT IF EXISTS products_foreignKey_1;
ALTER TABLE orders.products ADD CONSTRAINT products_foreignKey_1 FOREIGN KEY (
  product_pic
) REFERENCES orders.operators (
  operator_id
);
