{{
	config(
		materialized='view'
	)
}}

with customer as (
	select * from {{ ref('customers') }}
)

, orders as (
	select * from {{ ref('orders') }}
)

, customers_orders as (
	select 
		customer_id
		, min(order_date) as first_order_date
		, max(order_date) as most_recent_order_date
		, count(order_id) as number_of_orders
	from orders
	group by 1
)

select * from customers_orders

