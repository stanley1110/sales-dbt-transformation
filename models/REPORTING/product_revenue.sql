select
    product_id,
    order_date,
    product_name,
    order_item_quantity,
    order_item_product_price,
    revenue
from {{ ref("staging") }}
where order_status = 'CLOSED'
