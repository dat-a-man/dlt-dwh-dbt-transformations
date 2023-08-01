WITH base AS (

    SELECT 
    CONCAT('vfs-',_dlt_id) as stargazers_id,
    user, 
    starred_at 
    FROM `dlt-dev-external.dlthub_vfs_star_gazer_data_raw.stargazers`

)

SELECT * FROM base