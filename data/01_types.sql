-- Enum Type DDL

-- 商品ステータス
DROP TYPE IF EXISTS orders.product_status;
CREATE TYPE orders.product_status AS enum (
  'PREPARING',
  'ON_SALE',
  'END_OF_SALE',
  'SUSPENDED'
);

-- 受注ステータス
DROP TYPE IF EXISTS orders.order_status;
CREATE TYPE orders.order_status AS enum (
  'WORK_IN_PROGRESS',
  'CANCELED',
  'COMPLETED',
  'PREPARING'
);

