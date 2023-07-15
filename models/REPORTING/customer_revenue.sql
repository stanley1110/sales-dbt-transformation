select customer_id,
 order_date,
 customer_fname,customer_lname,
 customer_state,
 customer_city,order_item_quantity,order_item_product_price,revenue 
 from {{ ref('staging') }}
where order_status = 'CLOSED'
