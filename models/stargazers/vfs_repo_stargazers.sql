WITH base AS (

    SELECT 
    CONCAT('vfs-',_dlt_id) as stargazers_id,
    user, 
    starred_at 
    FROM `dlthub-analytics.dwh_vfs_stargazers_raw.stargazers`

)

SELECT * FROM base