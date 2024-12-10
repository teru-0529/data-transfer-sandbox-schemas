-- is_master_table=false

-- 3.商品(products)

-- Create Table
DROP TABLE IF EXISTS source.products CASCADE;
CREATE TABLE source.products (
  product_name varchar(30) NOT NULL,
  cost_price integer NOT NULL check (0 <= cost_price AND cost_price <= 9999999),
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp,
  created_by varchar(58),
  updated_by varchar(58)
);

-- Set Table Comment
COMMENT ON TABLE source.products IS '商品';

-- Set Column Comment
COMMENT ON COLUMN source.products.product_name IS '商品名';
COMMENT ON COLUMN source.products.cost_price IS '商品原価';
COMMENT ON COLUMN source.products.created_at IS '作成日時';
COMMENT ON COLUMN source.products.updated_at IS '更新日時';
COMMENT ON COLUMN source.products.created_by IS '作成者';
COMMENT ON COLUMN source.products.updated_by IS '更新者';

-- Set PK Constraint
ALTER TABLE source.products ADD PRIMARY KEY (
  product_name
);

-- Create 'set_update_at' Trigger
CREATE TRIGGER set_updated_at
  BEFORE UPDATE
  ON source.products
  FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
