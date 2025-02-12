-- is_master_table=false

-- 1.受注(orders)

-- Create Table
DROP TABLE IF EXISTS orders.orders CASCADE;
CREATE TABLE orders.orders (
  order_no varchar(10) NOT NULL check (order_no ~* '^RO-[0-9]{7}$'),
  order_date date NOT NULL DEFAULT current_timestamp,
  order_pic varchar(5) NOT NULL check (LENGTH(order_pic) = 5),
  customer_name varchar(50) NOT NULL,
  total_order_price integer NOT NULL DEFAULT 0 check (0 <= total_order_price AND total_order_price <= 9999999),
  remaining_order_price integer NOT NULL DEFAULT 0 check (0 <= remaining_order_price AND remaining_order_price <= 9999999),
  order_status orders.order_status NOT NULL DEFAULT 'PREPARING',
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp,
  created_by varchar(58),
  updated_by varchar(58)
);

-- Set Table Comment
COMMENT ON TABLE orders.orders IS '受注';

-- Set Column Comment
COMMENT ON COLUMN orders.orders.order_no IS '受注番号';
COMMENT ON COLUMN orders.orders.order_date IS '受注日';
COMMENT ON COLUMN orders.orders.order_pic IS '受注担当者ID';
COMMENT ON COLUMN orders.orders.customer_name IS '得意先名称';
COMMENT ON COLUMN orders.orders.total_order_price IS '受注金額';
COMMENT ON COLUMN orders.orders.remaining_order_price IS '受注残額';
COMMENT ON COLUMN orders.orders.order_status IS '受注ステータス';
COMMENT ON COLUMN orders.orders.created_at IS '作成日時';
COMMENT ON COLUMN orders.orders.updated_at IS '更新日時';
COMMENT ON COLUMN orders.orders.created_by IS '作成者';
COMMENT ON COLUMN orders.orders.updated_by IS '更新者';

-- Set PK Constraint
ALTER TABLE orders.orders ADD PRIMARY KEY (
  order_no
);

-- Create 'set_update_at' Trigger
CREATE TRIGGER set_updated_at
  BEFORE UPDATE
  ON orders.orders
  FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();

-- Create 'append_history' Function
DROP FUNCTION IF EXISTS orders.orders_audit();
CREATE OR REPLACE FUNCTION orders.orders_audit() RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'DELETE') THEN
    INSERT INTO public.operation_histories(schema_name, table_name, operation_type, table_key)
    SELECT TG_TABLE_SCHEMA, TG_TABLE_NAME, 'DELETE', OLD.order_no;
  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO public.operation_histories(operated_by, schema_name, table_name, operation_type, table_key)
    SELECT NEW.updated_by, TG_TABLE_SCHEMA, TG_TABLE_NAME, 'UPDATE', NEW.order_no;
  ELSIF (TG_OP = 'INSERT') THEN
    INSERT INTO public.operation_histories(operated_by, schema_name, table_name, operation_type, table_key)
    SELECT NEW.updated_by, TG_TABLE_SCHEMA, TG_TABLE_NAME, 'INSERT', NEW.order_no;
  END IF;
  RETURN null;
END;
$$ LANGUAGE plpgsql;

-- Create 'audit' Trigger
CREATE TRIGGER audit
  AFTER INSERT OR UPDATE OR DELETE
  ON orders.orders
  FOR EACH ROW
EXECUTE PROCEDURE orders.orders_audit();
