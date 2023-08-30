create database MSSQL_Assignment_01
use MSSQL_Assignment_01

create table overallOrders (
	order_id int,
	customer_name nvarchar(90),
	customer_address nvarchar(150),
	phone_number nvarchar(14),
	order_date date,
	item_id int,
	item_name nvarchar(150),
	item_description nvarchar(200),
	item_unit nvarchar(10),
	item_price numeric(10,2),
	item_qty int,
	order_item_price numeric(10,2),
	order_item_qty int,

	constraint PK_overallOrders primary key(order_id, item_id)
)
go
INSERT INTO overallOrders (order_id, customer_name, customer_address, phone_number, order_date,
                      item_id, item_name, item_description, item_unit, item_price,
                      item_qty, order_item_price, order_item_qty)
VALUES
(123, N'Nguyễn Văn An', N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội', N'987654321', '2009-11-18',
 101, N'Máy Tính T450', N'Máy nhập mới', N'Chiếc', 10, 100, 15.99, 5);

 go

 UPDATE overallOrders
SET item_price = 850
WHERE item_price = 10;

  UPDATE overallOrders
SET order_item_price = 1000
WHERE order_item_price = 15.99;


 go
INSERT INTO overallOrders (order_id, customer_name, customer_address, phone_number, order_date,
                      item_id, item_name, item_description, item_unit, item_price,
                      item_qty, order_item_price, order_item_qty)
VALUES
(123, N'Nguyễn Văn An', N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội', N'987654321', '2009-11-18',
 105, N'Điện Thoại
Nokia5670', N'Điện thoại đang
hot', N'Chiếc', 150, 500, 200, 1);

 go


 go
INSERT INTO overallOrders (order_id, customer_name, customer_address, phone_number, order_date,
                      item_id, item_name, item_description, item_unit, item_price,
                      item_qty, order_item_price, order_item_qty)
VALUES
(123, N'Nguyễn Văn An', N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội', N'987654321', '2009-11-18',
 108, N'Máy In Samsung 450', N'Máy in đang ế', N'Chiếc', 70, 95, 100, 4);

 go

 go
INSERT INTO overallOrders (order_id, customer_name, customer_address, phone_number, order_date,
                      item_id, item_name, item_description, item_unit, item_price,
                      item_qty, order_item_price, order_item_qty)
VALUES
(124, N'Kiều Quốc Anh', N'44, Tổ 1, Tô Hiến Thành, Phúc La, Hà Đông, Hà Nội', N'961056732', '2023-8-28',
 101, N'Máy Tính T450', N'Máy nhập mới', N'Chiếc', 850, 95, 1000, 10);

 go

 go
INSERT INTO overallOrders (order_id, customer_name, customer_address, phone_number, order_date,
                      item_id, item_name, item_description, item_unit, item_price,
                      item_qty, order_item_price, order_item_qty)
VALUES
(124, N'Nguyễn Văn An', N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội', N'987654321', '2009-11-18',
 104, N'Card Đồ Họa', N'Card Mới', N'Chiếc', 500, 100, 650, 5);

 go

 UPDATE overallOrders
SET customer_name = N'Kiều Quốc Anh',
    customer_address = N'44, Tổ 1, Tô Hiến Thành, Phúc La, Hà Đông, Hà Nội',
	phone_number = '961056732',
	order_date = '2023-08-28'
WHERE item_id = 104;
 select * from overallOrders


 -- Devive into 4 tables
	--order_id int,
	--customer_name nvarchar(90),
	--customer_address nvarchar(150),
	--phone_number nvarchar(14),
	--order_date date,
	--item_id int,
	--item_name nvarchar(150),
	--item_description nvarchar(200),
	--item_unit nvarchar(10),
	--item_price numeric(10,2),
	--item_qty int,
	--order_item_price numeric(10,2),
	--order_item_qty int,
	

 create table items (
	item_id int primary key,
	item_name nvarchar(150),
	item_description nvarchar(200),
	item_unit nvarchar(10),
	item_import_price numeric(10,2),
	item_export_price numeric(10,2),
	item_qty int,
	item_status nvarchar(40)
 )

 -- thêm customer_id để quản lý familiar buyers

 create table customers (
	customer_id int primary key,
	customer_name nvarchar(90),
	customer_address nvarchar(150),
	phone_number nvarchar(14),
	customer_status nvarchar(40)
 )

 create table orders (
	order_id int primary key,
	customer_id int,
	order_date date,
	order_status nvarchar(40)
 )

  create table orderItems (
	order_id int ,
	item_id int ,
	item_qty int
	 CONSTRAINT PK_orderItems PRIMARY KEY (order_id, item_id)
 )

 INSERT INTO customers (customer_id, customer_name , customer_address, phone_number, customer_status)
VALUES
(1, N'Nguyễn Văn An', N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội', '987654321', 'normal');


 INSERT INTO customers (customer_id, customer_name , customer_address, phone_number, customer_status)
VALUES
(2, N'Kiều Quốc Anh', N'44, Tổ 1, Tô Hiến Thành, Phúc La, Hà Đông, Hà Nội', '961056732', 'vip');

 select * from overallOrders
  select * from customers


  INSERT INTO items (item_id, item_name , item_description, item_unit, item_import_price, item_export_price, item_qty, item_status)
VALUES
(101, N'Máy Tính T450', N'Máy nhập mới', 'Chiếc', 850.00, 1000.00, 100, 'in stock'),
(104, N'Card Đồ Họa', N'Card Mới', 'Chiếc', 500.00, 650.00, 100, 'in stock'),
(105, N'Điện Thoại Nokia5670', N'Điện thoại đang hot', 'Chiếc', 150.00, 200.00, 500, 'in stock'),
(108, N'Máy In Samsung 450', N'Máy in đang ế', 'Chiếc', 70.00, 100, 95, 'in stock')


 UPDATE items
SET item_unit = N'Chiếc'

 select * from overallOrders
  select * from customers
    select * from items


	  INSERT INTO orders(order_id, customer_id , order_date, order_status)
VALUES
(123, 1, '2009-11-18', 'Complete'),
(124, 2, '2023-08-28', 'Delivering')

 select * from overallOrders
  select * from customers
    select * from items
	  select * from orders

	  	  INSERT INTO orderItems(order_id, item_id , item_qty)
VALUES
(123, 101, 5 ),
(123, 105, 1),
(123, 108, 4),
(124, 101, 10),
(124, 104, 5)

 select * from overallOrders
  select * from customers
    select * from items
	  select * from orders	  
	  select * from orderItems


	  ALTER TABLE orders
ADD CONSTRAINT FK_Item FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

	  ALTER TABLE orderItems
ADD CONSTRAINT FK_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id)

	  ALTER TABLE orderItems
ADD CONSTRAINT FK_item_id FOREIGN KEY (item_id) REFERENCES items(item_id)

go
--4, 
use MSSQL_Assignment_01
  select * from customers
    select * from items
	  select * from orders	  
	  select * from orderItems	 
--5, 
select * from customers c order by c.customer_name ASC;
select * from items c order by c.item_import_price DESC;

SELECT c.customer_name, i.item_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderItems oi ON o.order_id = oi.order_id
JOIN items i ON oi.item_id = i.item_id
where c.customer_name = N'Nguyễn Văn An';
--6,
SELECT COUNT(*) AS total_customers
FROM customers;
SELECT COUNT(*) AS total_customers
FROM items;

go
SELECT c.customer_id, c.customer_name, o.order_id, SUM(i.item_export_price * oi.item_qty) AS total_amount
FROM customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Items i ON oi.item_id = i.item_id
GROUP BY c.customer_id, c.customer_name, o.order_id;

go
go
WITH OrderTotals AS (
    SELECT c.customer_id, SUM(i.item_export_price * oi.item_qty) AS total_amount
    FROM customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN OrderItems oi ON o.order_id = oi.order_id
    JOIN Items i ON oi.item_id = i.item_id
    GROUP BY c.customer_id
	--select oi.order_id, SUM(i.item_export_price * oi.item_qty) AS total_amount
	--from orderItems oi
	--join items i on oi.item_id = i.item_id
	--GROUP BY  oi.order_id
)

SELECT c.customer_id, o.order_id, oi.item_id, i.item_name, oi.item_qty,i.item_export_price,(i.item_export_price * oi.item_qty) as qty_price, ot.total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Items i ON oi.item_id = i.item_id
JOIN OrderTotals ot ON c.customer_id = ot.customer_id
ORDER BY c.customer_id, o.order_id;

go

--7
ALTER TABLE items
ADD CONSTRAINT positiveItemPrice
CHECK (items.item_export_price > 0 and items.item_import_price > 0)

select * from items
update items set appear_date = '2000-03-12';

go
--CREATE FUNCTION IsPreviousDay(@inputDate DATE)
--RETURNS BIT
--AS
--BEGIN
--    DECLARE @currentDate DATE = GETDATE();

--    IF @inputDate < @currentDate
--        RETURN 1;
--    ELSE
--        RETURN 0;
--END;

go
  select * from customers
    select * from items
	  select * from orders	  
	  select * from orderItems


GO
ALTER TABLE orders
ADD CONSTRAINT CheckPreviousDay
CHECK (order_date < GETDATE());
GO

update orders set order_date = '2023-8-30';
