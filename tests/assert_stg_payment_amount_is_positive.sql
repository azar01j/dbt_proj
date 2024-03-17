with payments as
(
    select * from {{ ref('stg_payments') }}

)


select 
order_id, sum(amount) as tot_amount

from payments
group by 1 
having not(tot_amount >= 0)