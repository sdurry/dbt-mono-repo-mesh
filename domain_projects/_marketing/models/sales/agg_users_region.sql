WITH dim_customers AS (
  /* Customer dimensions table */
  SELECT
    *
  FROM {{ ref('platform', 'dim_customers') }}
), aggregation AS (
  SELECT
    REGION,
    NATION,
    COUNT(CUSTOMER_KEY) AS user_count
  FROM dim_customers
  GROUP BY
    REGION,
    NATION
), agg_users_region_sql AS (
  SELECT
    *
  FROM aggregation
)
SELECT
  *
FROM agg_users_region_sql