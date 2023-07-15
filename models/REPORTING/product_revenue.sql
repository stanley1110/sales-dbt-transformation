select product_id,
 product_name,
 revenue 
 from {{ ref('staging') }}
where order_status = 'CLOSED'