SELECT *
FROM {{ref('stg_raw__adwords')}}
UNION ALL
SELECT *
FROM {{ref('stg_raw__bing')}}
UNION ALL
SELECT *
FROM {{ref('stg_raw__facebook')}}
UNION ALL
SELECT *
FROM {{ref('stg_raw__criteo')}}
ORDER BY date_date
;
{{ dbt_utils.union_relations(
    relations=[ref('stg_raw__criteo'), ref('stg_raw__adwords'),ref('stg_raw__facebook'),ref('stg_raw__bing')]
) }}
ORDER BY date_date, paid_source, campaign_key