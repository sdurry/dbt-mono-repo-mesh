WITH dim_customers AS (
  /* Customer dimensions table */
  SELECT
    *
  FROM {{ ref('platform', 'dim_customers') }}
), aggregation AS (
  SELECT
    REGION,
    COUNT(CUSTOMER_KEY) AS count_CUSTOMER_KEY
  FROM dim_customers
  GROUP BY
    REGION
), new_models_sql AS (
  SELECT
    *
  FROM aggregation
)
SELECT
  *
FROM new_models_sql