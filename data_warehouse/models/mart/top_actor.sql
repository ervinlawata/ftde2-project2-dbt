{{ config(
    materialized="table",
    schema="mart"
) }}

select
	dfa.actor_id,
	CONCAT(da.first_name, ' ', da.last_name) AS actor_name,
	COUNT(dfa.actor_id) as total_plays_in_film
from
	{{ ref('dim_film_actor') }} dfa
join
	{{ ref('dim_actor') }} da on dfa.actor_id = da.actor_id 
group by 
    dfa.actor_id, actor_name
order by 
    total_plays_in_film DESC