WITH base AS (

    SELECT 
    CONCAT('dlt-',_dlt_id) as stargazers_id,
    user, 
    starred_at 
    FROM `dlthub-analytics.dwh_dlt_stargazers_raw.stargazers`

)

SELECT * FROM base