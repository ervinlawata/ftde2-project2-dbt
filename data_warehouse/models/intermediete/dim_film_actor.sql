{{ config(
    materialized="table",
    schema="intermediete"
) }}
SELECT
    *
FROM {{ ref('film_actor') }}