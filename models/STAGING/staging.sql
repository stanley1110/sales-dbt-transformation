select
    cast(order_id as string) as order_id,
    CAST(order_date AS DATE) as order_date,
    order_status,
    oi.order_item_product_id,
    oi.order_item_product_price,
    oi.order_item_quantity,
    {{
        revenue(
            "oi.order_item_quantity",
            "oi.order_item_product_price",
        )
    }} as revenue,
    p.product_name,
    cast(p.product_id as string) as product_id,
    c.customer_city,
    c.customer_lname,
    c.customer_fname,
    c.customer_state,
    cast(c.customer_id as string) as customer_id,
    ca.category_name

from {{ ref("orders") }} as o
left join {{ ref("order_items") }} as oi on o.order_id = oi.order_item_order_id
left join {{ ref("customers") }} as c on o.order_customer_id = c.customer_id
left join {{ ref("products") }} as p on oi.order_item_product_id = p.product_id
left join {{ ref("category") }} as ca on p.product_cateogry_id = ca.category_id
