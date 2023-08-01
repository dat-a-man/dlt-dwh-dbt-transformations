-- models/dlt_repo_star_starred.sql
WITH base AS (

    SELECT 
    CONCAT('dlt-',STSR._dlt_id) as stargazers_starred_id,
    CONCAT('dlt-',S._dlt_id) as stargazers_id,
    STSR.user,
    STSR.organization,
    STSR.repository,
    STSR.starred_repo_full_name,
    STSR.starred_repo_name,
    STSR.starred_repo_starred_at,
    STSR.starred_repo_homepage,
    STSR.starred_repo_stargazers

    FROM `dlt-dev-external.dlthub_dlt_dstar_gazer_data_raw.stargazers_starred_repos` STSR 
    JOIN `dlt-dev-external.dlthub_dlt_dstar_gazer_data_raw.stargazers` S 
    ON S.user = STSR.user

)

SELECT * FROM base