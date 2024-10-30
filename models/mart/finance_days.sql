{{config(materialized='table')}}
SELECT
date_date
,count(orders_id) AS nb_transactions
,ROUND(sum(revenue),2) AS revenue
,ROUND(avg(revenue),2) AS average_basket
,ROUND(sum(margin),2) AS margin
,ROUND(sum(operational_margin),2) AS operational_margin
,ROUND(sum(purchase_cost),2) AS purchase_cost
,ROUND(sum(shipping_fee),2) AS shipping_fee
,ROUND(sum(logcost),2) AS logcost
,ROUND(sum(quantity),2) AS qty
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC
