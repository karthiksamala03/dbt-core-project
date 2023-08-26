{{
	config(
		materialized='table'
	)
}}

select 
	id  as customer_id
	, first_name
	, last_name
from DBT_PROJECT_TABLES.PUBLIC.CUSTOMER_INFO