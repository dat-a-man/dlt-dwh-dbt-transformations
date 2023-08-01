-- models/dlt_repo_pr_reactions.sql
WITH base AS (

    SELECT 
    CONCAT('dlt-',PRR._dlt_id) as pr_reactions_id,
    CONCAT('dlt-',PR.number) as pr_id,
    PRR.user__login as author_reacted,
    PRR.content,
    PRR.created_at

    FROM `dlt-dev-external.dwh_github_dlt_raw_20230729102531.pull_requests` PR 
    JOIN `dlt-dev-external.dwh_github_dlt_raw_20230729102531.pull_requests__reactions` PRR 
    ON PR._dlt_id = PRR._dlt_parent_id

)

SELECT * FROM base
