{{ config(
    materialized="table",
    schema="intermediete"
) }}
SELECT
    *
FROM {{ ref('address') }}