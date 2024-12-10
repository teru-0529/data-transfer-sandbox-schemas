-- is_master_table=false

-- 2.受注明細(order_details)

-- Create Table
DROP TABLE IF EXISTS source.order_details CASCADE;
CREATE TABLE source.order_details (
  order_no integer NOT NULL,
  order_detail_no integer NOT NULL,
  product_name varchar(30),
  receiving_quantity integer check (0 <= receiving_quantity AND receiving_quantity <= 1000),
  shipping_flag boolean,
  canceled_flag boolean,
  sellling_price integer NOT NULL check (0 <= sellling_price AND sellling_price <= 9999999),
  cost_price integer NOT NULL check (0 <= cost_price AND cost_price <= 9999999),
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp,
  created_by varchar(58),
  updated_by varchar(58)
);

-- Set Table Comment
COMMENT ON TABLE source.order_details IS '受注明細';

-- Set Column Comment
COMMENT ON COLUMN source.order_details.order_no IS '受注番号';
COMMENT ON COLUMN source.order_details.order_detail_no IS '受注明細番号';
COMMENT ON COLUMN source.order_details.product_name IS '商品名';
COMMENT ON COLUMN source.order_details.receiving_quantity IS '受注数';
COMMENT ON COLUMN source.order_details.shipping_flag IS '出荷済フラグ';
COMMENT ON COLUMN source.order_details.canceled_flag IS 'キャンセルフラグ';
COMMENT ON COLUMN source.order_details.sellling_price IS '販売単価';
COMMENT ON COLUMN source.order_details.cost_price IS '商品原価';
COMMENT ON COLUMN source.order_details.created_at IS '作成日時';
COMMENT ON COLUMN source.order_details.updated_at IS '更新日時';
COMMENT ON COLUMN source.order_details.created_by IS '作成者';
COMMENT ON COLUMN source.order_details.updated_by IS '更新者';

-- Set PK Constraint
ALTER TABLE source.order_details ADD PRIMARY KEY (
  order_no,
  order_detail_no
);

-- Create 'set_update_at' Trigger
CREATE TRIGGER set_updated_at
  BEFORE UPDATE
  ON source.order_details
  FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
