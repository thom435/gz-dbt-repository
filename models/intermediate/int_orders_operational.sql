SELECT
orders_margin.*
,ROUND (orders_margin.margin+ship.shipping_fee-ship.logcost-ship.ship_cost,2) AS Operational_margin
FROM {{ref("int_orders_margin")}} AS orders_margin
LEFT JOIN {{ref("stg_raw__ship")}} AS ship
ON orders_margin.orders_id=ship.orders_id
ORDER BY orders_id DESC
