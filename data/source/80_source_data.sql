INSERT INTO source.operaters VALUES ('U0001','織田信長',default,default,default,default);
INSERT INTO source.operaters VALUES ('U0002','豊臣秀吉',default,default,default,default);
INSERT INTO source.operaters VALUES ('U0003','武田信玄',default,default,default,default);
INSERT INTO source.operaters VALUES ('U0004','上杉謙信',default,default,default,default);

INSERT INTO source.products VALUES ('フリクションボールペン',200,default,default,default,default);
INSERT INTO source.products VALUES ('ジェットストリーム',350,default,default,default,default);
INSERT INTO source.products VALUES ('クルトガ',400,default,default,default,default);
INSERT INTO source.products VALUES ('LAMY万年筆',3000,default,default,default,default);
INSERT INTO source.products VALUES ('Mont Blanc万年筆',50000,default,default,default,default);

INSERT INTO source.orders VALUES (1,'20241225','織田信長','徳川物産株式会社',default,default,default,default);
INSERT INTO source.orders VALUES (2,'20230412','豊臣秀吉','徳川物産株式会社',default,default,default,default);
INSERT INTO source.orders VALUES (3,'20240802','上杉謙信','徳川物産株式会社',default,default,default,default);
INSERT INTO source.orders VALUES (4,'20241010','織田信長','徳川物産株式会社',default,default,default,default);
INSERT INTO source.orders VALUES (5,'20231202','武田信玄','徳川物産株式会社',default,default,default,default);
INSERT INTO source.orders VALUES (11,'20241325','織田信長','徳川物産株式会社',default,default,default,default); --日付フォーマット
INSERT INTO source.orders VALUES (12,'20241225','坂本龍馬','徳川物産株式会社',default,default,default,default); --担当者無し
INSERT INTO source.orders VALUES (13,'20241225','織田信長','徳川物産株式会社',default,default,default,default); --明細無し
INSERT INTO source.orders VALUES (15,'20241225','織田信長','徳川物産株式会社',default,default,default,default); --明細無し

INSERT INTO source.order_details VALUES (1,1,'フリクションボールペン',10,false,false,300,200,default,default,default,default);
INSERT INTO source.order_details VALUES (2,1,'Mont Blanc万年筆',5,true,false,83000,50000,default,default,default,default);
INSERT INTO source.order_details VALUES (3,1,'フリクションボールペン',5,false,true,300,220,default,default,default,default);
INSERT INTO source.order_details VALUES (3,2,'クルトガ',20,false,false,500,380,default,default,default,default);
INSERT INTO source.order_details VALUES (4,1,'ジェットストリーム',5,false,true,440,350,default,default,default,default);
INSERT INTO source.order_details VALUES (4,2,'クルトガ',20,true,false,550,400,default,default,default,default);
INSERT INTO source.order_details VALUES (4,3,'フリクションボールペン',10,true,false,300,200,default,default,default,default);
INSERT INTO source.order_details VALUES (5,1,'ジェットストリーム',5,false,true,440,350,default,default,default,default);
INSERT INTO source.order_details VALUES (5,2,'ジェットストリーム',15,false,false,440,340,default,default,default,default);
INSERT INTO source.order_details VALUES (5,3,'ジェットストリーム',15,false,false,440,380,default,default,default,default);
INSERT INTO source.order_details VALUES (5,4,'クルトガ',20,true,false,550,400,default,default,default,default);

INSERT INTO source.order_details VALUES (11,1,'フリクションボールペン',10,false,false,300,200,default,default,default,default);
INSERT INTO source.order_details VALUES (12,1,'フリクションボールペン',10,false,false,300,200,default,default,default,default);
INSERT INTO source.order_details VALUES (14,1,'フリクションボールペン',10,false,false,300,200,default,default,default,default); --本体無し
INSERT INTO source.order_details VALUES (15,1,'トンボ鉛筆1ダース',10,false,false,300,200,default,default,default,default); --商品無し
