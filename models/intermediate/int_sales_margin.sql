SELECT
sales.*
,product.purchase_price
,quantity*product.purchase_price AS purchase_cost
,ROUND(sales.revenue -(sales.quantity*product.purchase_price),2) AS margin
FROM {{ref("stg_raw__sales")}} AS sales
LEFT JOIN {{ref("stg_raw__product")}} AS product
ON sales.products_id=product.products_id
;
 WITH sub_int_sales AS (
    SELECT
    sales.*
    ,product.purchase_price
    ,quantity*product.purchase_price AS purchase_cost
    ,ROUND(sales.revenue -(sales.quantity*product.purchase_price),2) AS margin
    FROM {{ref("stg_raw__sales")}} AS sales
    LEFT JOIN {{ref("stg_raw__product")}} AS product
    ON sales.products_id=product.products_id  
 )
 SELECT
     -- snip
     sub_int_sales.*
     ,{{ margin_percent('revenue','purchase_cost',2) }} AS margin_percent
 FROM sub_int_sales
 -- snip