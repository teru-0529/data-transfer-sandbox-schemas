-- is_master_table=false

-- 1.受注(orders)

-- Create Table
DROP TABLE IF EXISTS source.orders CASCADE;
CREATE TABLE source.orders (
  order_no integer NOT NULL,
  order_date varchar(8) NOT NULL,
  order_pic varchar(30) check (LENGTH(order_pic) >= 3),
  customer_name varchar(50) NOT NULL,
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp,
  created_by varchar(58),
  updated_by varchar(58)
);

-- Set Table Comment
COMMENT ON TABLE source.orders IS '受注';

-- Set Column Comment
COMMENT ON COLUMN source.orders.order_no IS '受注番号';
COMMENT ON COLUMN source.orders.order_date IS '受注日';
COMMENT ON COLUMN source.orders.order_pic IS '受注担当者名';
COMMENT ON COLUMN source.orders.customer_name IS '得意先名称';
COMMENT ON COLUMN source.orders.created_at IS '作成日時';
COMMENT ON COLUMN source.orders.updated_at IS '更新日時';
COMMENT ON COLUMN source.orders.created_by IS '作成者';
COMMENT ON COLUMN source.orders.updated_by IS '更新者';

-- Set PK Constraint
ALTER TABLE source.orders ADD PRIMARY KEY (
  order_no
);

-- Create 'set_update_at' Trigger
CREATE TRIGGER set_updated_at
  BEFORE UPDATE
  ON source.orders
  FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
