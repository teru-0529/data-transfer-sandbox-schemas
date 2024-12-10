# data-transfer-sandbox-schemas

【sandbox】データ移行用スキーマ定義

## sqlチェック

### sourceDB(Work)

```sql
DELETE FROM work.gen_order_no;
DELETE FROM work.gen_product_id;

INSERT INTO work.gen_product_id VALUES ('P0001','フリクションボールペン',default,default,'WORK','WORK');
INSERT INTO work.gen_product_id VALUES ('P0002','ジェットストリーム',default,default,'WORK','WORK');
INSERT INTO work.gen_order_no VALUES ('RO-9000010','P0001',1,1,default,default,'WORK','WORK');
INSERT INTO work.gen_order_no VALUES ('RO-9000010','P0002',1,2,default,default,'WORK','WORK');
INSERT INTO work.gen_order_no VALUES ('RO-9000011','P0002',1,3,default,default,'WORK','WORK');
INSERT INTO work.gen_order_no VALUES ('RO-9000020','P0001',2,1,default,default,'WORK','WORK');
```

### distDB

```sql
DELETE FROM dist.order_details;
DELETE FROM dist.orders;
DELETE FROM dist.products;
DELETE FROM dist.operators;

INSERT INTO dist.operators VALUES ('U0001','織田信長',default,default,'MIGRATION','MIGRATION');
INSERT INTO dist.products VALUES ('P0001','フリクションボールペン',130,'U0001','ON_SALE',default,default,'MIGRATION','MIGRATION');
INSERT INTO dist.orders VALUES ('RO-0000001',default,'U0001','徳川物産株式会社',2300,2300,default,default,default,'MIGRATION','MIGRATION');
INSERT INTO dist.orders VALUES ('RO-0000002','2024-12-08','U0001','徳川物産株式会社',5000,5000,'WORK_IN_PROGRESS',default,default,'MIGRATION','MIGRATION');
INSERT INTO dist.order_details VALUES ('RO-0000001','P0001',10,0,0,10,230,130,'WORK_IN_PROGRESS',default,default,'MIGRATION','MIGRATION');
```
