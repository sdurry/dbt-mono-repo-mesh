with orders as (
    select * from {{ ref('platform', 'fct_orders') }}
),

final as (
    select
        date_trunc(MONTH, orders.order_date) as order_month 
        , count(order_key) as total_orders
        , sum(net_item_sales_amount) as total_sales_amount
    from orders
    group by 1
    order by 1 asc
)

select * from final  