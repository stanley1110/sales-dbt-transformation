select product_id,
 order_date,
 product_name,
 revenue 
 from {{ ref('staging') }}
where order_status = 'CLOSED'