-- 更新区分
DROP TYPE IF EXISTS operation_type;
CREATE TYPE operation_type AS enum (
  'INSERT',
  'UPDATE',
  'DELETE'
);

-- 業務日付区分
DROP TYPE IF EXISTS business_date_type;
CREATE TYPE business_date_type AS enum (
  'BASE'
);

-- オペレーション履歴
DROP TABLE IF EXISTS operation_histories CASCADE;
CREATE TABLE operation_histories (
  operated_at timestamp NOT NULL DEFAULT current_timestamp,
  operated_by varchar(58),
  schema_name text NOT NULL,
  table_name text NOT NULL,
  table_key text NOT NULL,
  operation_type operation_type NOT NULL
);

COMMENT ON TABLE operation_histories IS 'オペレーション履歴';
COMMENT ON COLUMN operation_histories.operated_at IS 'オペレーション日時';
COMMENT ON COLUMN operation_histories.operated_by IS 'トレースID';
COMMENT ON COLUMN operation_histories.schema_name IS 'スキーマ';
COMMENT ON COLUMN operation_histories.table_name IS 'テーブル';
COMMENT ON COLUMN operation_histories.table_key IS 'プライマリキー';
COMMENT ON COLUMN operation_histories.operation_type IS '更新区分';

-- 更新日時の設定
CREATE OR REPLACE FUNCTION set_updated_at() RETURNS TRIGGER AS $$
BEGIN
  -- 更新日時
  NEW.updated_at := now();
  return NEW;
END;
$$ LANGUAGE plpgsql;

-- DDL変更時に'reload schema'を通知する
-- Create an event trigger function
CREATE OR REPLACE FUNCTION pgrst_watch() RETURNS event_trigger
  LANGUAGE plpgsql
  AS $$
BEGIN
  NOTIFY pgrst, 'reload schema';
END;
$$;

-- This event trigger will fire after every ddl_command_end event
CREATE EVENT TRIGGER pgrst_watch
  ON ddl_command_end
  EXECUTE PROCEDURE pgrst_watch();

CREATE SCHEMA IF NOT EXISTS orders;
