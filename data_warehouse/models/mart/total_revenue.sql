{{ config(
    materialized="table",
    schema="mart"
) }}

select
    sum(amount) as total_revenue,
    payment_date
from {{ref('fact_payment')}}
GROUP BY payment_date