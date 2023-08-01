WITH base AS (

    SELECT 
    CONCAT('dlt-',_dlt_id) as stargazers_id,
    user, 
    starred_at 
    FROM `dlt-dev-external.dlthub_dlt_dstar_gazer_data_raw.stargazers`

)

SELECT * FROM base