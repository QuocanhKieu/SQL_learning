CREATE TABLE `customers` (
  `customer_id` int PRIMARY KEY,
  `customer_name` varchar(40),
  `customer_address` varchar(120),
  `customer_city` varchar(40),
  `customer_state` varchar(40)
);

CREATE TABLE `orders` (
  `order_id` int PRIMARY KEY,
  `customer_id` int,
  `order_date` date
);

CREATE TABLE `items` (
  `item_id` int PRIMARY KEY,
  `item_description` varchar(140),
  `item_price` numeric(10, 2)
);

CREATE TABLE `order_items` (
  `order_id` int,
  `item_id` int,
  `item_qty` int,
  `primary` key(order_id, item_id)
);

ALTER TABLE `orders` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

ALTER TABLE `order_items` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

ALTER TABLE `order_items` ADD FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);


create database MSSQL_Assignment_01
use MSSQL_Assignment_01


	