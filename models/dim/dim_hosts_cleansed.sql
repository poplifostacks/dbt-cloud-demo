{{
  config(
    materialized = 'view'
    )
}} 
WITH src_hosts AS (
    SELECT *
    FROM
        {{ ref('src_hosts') }}
)

SELECT
    host_id,
    is_superhost,
    created_at,
    updated_at,
    updated_at_second,
    COALESCE(
        host_name,
        'Anonymous'
    ) AS host_name
FROM
    src_hosts
