create database Products
use Products

create table customers (
	customer_id int primary key,
	customer_name varchar(40),
	customer_address varchar(120),
	customer_city varchar(40),
	customer_state varchar(40),
)

create table orders (
	order_id int primary key,
	customer_id int references customers(customer_id),
	order_date date,
)

create table items (
	item_id int primary key,
	item_description varchar(140),
	item_price numeric(10, 2)	
)

create table order_items (
	order_id int references orders(order_id),
	item_id int references items(item_id),
	item_qty int,

	CONSTRAINT order_items_pk PRIMARY KEY (order_id, item_id)
)

