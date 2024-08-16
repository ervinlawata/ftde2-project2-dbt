{{ config(
    materialized="table",
    schema="mart"
) }}

SELECT 
    df.title,
    df.release_year, 
    df.rating,
    COUNT(fp.rental_id) as best_selling_film
FROM 
    {{ ref('fact_payment') }} fp
JOIN 
    {{ ref('dim_rental') }} dr on fp.rental_id = dr.rental_id 
JOIN 
    {{ ref('dim_inventory') }} di on dr.inventory_id = di.inventory_id 
JOIN 
    {{ ref('dim_film') }} df on di.film_id = df.film_id 
GROUP BY 
    df.title, df.release_year, df.rating
ORDER BY 
    best_selling_film desc, df.title ASC