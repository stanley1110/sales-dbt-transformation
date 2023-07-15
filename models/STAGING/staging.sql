select 
order_id,order_date, order_status, order_customer_id,
oi.order_item_product_id,oi.order_item_product_price,
oi.order_item_quantity,{{ revenue('oi.order_item_quantity','oi.order_item_product_price',)}} as revenue,
p.product_name
,c.customer_city,c.customer_lname,c.customer_fname,
c.customer_state,c.customer_street,c.customer_zipcode,c.customer_id


from {{ ref('orders') }} as o
left join {{ ref('order_items') }} as oi
on o.order_id = oi.order_item_order_id
left join {{ ref('customers') }} as c
on o.order_customer_id = c.customer_id
left join {{ ref('products') }} as p
on oi.order_item_product_id = p.product_id