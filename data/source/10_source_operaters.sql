-- is_master_table=false

-- 4.担当者(operaters)

-- Create Table
DROP TABLE IF EXISTS source.operaters CASCADE;
CREATE TABLE source.operaters (
  operator_id varchar(5) NOT NULL,
  operator_name varchar(30) NOT NULL check (LENGTH(operator_name) >= 3),
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp,
  created_by varchar(58),
  updated_by varchar(58)
);

-- Set Table Comment
COMMENT ON TABLE source.operaters IS '担当者';

-- Set Column Comment
COMMENT ON COLUMN source.operaters.operator_id IS '担当者ID';
COMMENT ON COLUMN source.operaters.operator_name IS '担当者名';
COMMENT ON COLUMN source.operaters.created_at IS '作成日時';
COMMENT ON COLUMN source.operaters.updated_at IS '更新日時';
COMMENT ON COLUMN source.operaters.created_by IS '作成者';
COMMENT ON COLUMN source.operaters.updated_by IS '更新者';

-- Set PK Constraint
ALTER TABLE source.operaters ADD PRIMARY KEY (
  operator_id
);

-- Create 'set_update_at' Trigger
CREATE TRIGGER set_updated_at
  BEFORE UPDATE
  ON source.operaters
  FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
