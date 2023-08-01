-- models/dlt_repo_commen_reactions.sql
WITH base AS (

    SELECT 
    CONCAT('dlt-',PRCR._dlt_id) as pr_comment_reactin_id,
    CONCAT('dlt-',PRC.id) as pr_comment_id,
    CONCAT('dlt-',number) as pr_id,
    PRCR.user__login as author_reacted,
    PRCR.content,
    PRCR.created_at

    FROM `dlthub-analytics.dwh_github_dlt_raw.pull_requests__comments__reactions` PRCR 
    JOIN `dlthub-analytics.dwh_github_dlt_raw.pull_requests__comments` PRC 
    ON PRC._dlt_id = PRCR._dlt_parent_id
    JOIN `dlthub-analytics.dwh_github_dlt_raw.pull_requests` PR 
    ON PR._dlt_id = PRC._dlt_parent_id
)

SELECT * FROM base
