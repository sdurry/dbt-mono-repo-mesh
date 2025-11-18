WITH dim_customers AS (
  /* Customer dimensions table */
  SELECT
    *
  FROM {{ ref('platform', 'dim_customers') }}
), fct_orders AS (
  /* orders fact table */
  SELECT
    *
  FROM {{ ref('platform', 'fct_orders') }}
), "join" AS (
  SELECT
    *
  FROM dim_customers
  JOIN fct_orders
    USING (CUSTOMER_KEY)
), aggregation AS (
  SELECT
    NATION,
    ORDER_DATE,
    SUM(NET_ITEM_SALES_AMOUNT) AS LTV,
    COUNT(DISTINCT CUSTOMER_KEY) AS unique_customer
  FROM "join"
  GROUP BY
    NATION,
    ORDER_DATE
), viz_nation_aggregate_sql AS (
  SELECT
    *
  FROM aggregation
)
SELECT
  *
FROM viz_nation_aggregate_sql