{{
  config(
    materialized = "table"
  )
}}


with orders as
(
    select * from {{ ref('stg_orders') }}
),

payments as 

(
    select * from {{ ref('stg_payments') }}
),

customers  as

(
    select * from {{ ref('dim_customers') }}
),

final as

(
    select 
    ord.order_id,
    cus.customer_id,
    pay.amount
    from orders ord
    left join payments pay on ord.order_id=pay.payment_id 
    left join customers cus on ord.customer_id=cus.customer_id
)

select * from final