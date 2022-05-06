{{ config(tags = ['payment']) }}

select * 
from {{ ref('orders' )}}
where amount < 0