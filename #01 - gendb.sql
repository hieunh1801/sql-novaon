create database novaon_test
use novaon_test

create table product(
	product_id serial primary key,
	product_name varchar,
	product_group varchar,
	price money,
	description text
)

create table orders(
	orders_id serial primary key,
	order_date date,
	total money,
	customer_id serial,
	description text
)

create table order_detail(
	order_detail_id serial primary key,
	product_id serial,
	orders_id serial,
	quantity int,
	price money,
	description text
)