SELECT
finance.date_date
,ROUND(operational_margin-ads_cost,2) AS ads_margin
,finance.average_basket
,finance.operational_margin
,campaign.ads_cost
,campaign.ads_impression
,campaign.ads_clicks
,finance.qty
,finance.revenue
,finance.purchase_cost
,finance.margin
,finance.shipping_fee
,finance.logcost
FROM {{ref("finance_days")}} as finance
LEFT JOIN {{ref("int_campaigns_day")}} as campaign
ON finance.date_date=campaign.date_date