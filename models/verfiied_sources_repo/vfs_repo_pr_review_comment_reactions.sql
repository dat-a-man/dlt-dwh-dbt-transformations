-- models/dlt_repo_pr_review_comment_reactions.sql
WITH base AS (

    SELECT 
    CONCAT('vfs-',PRRRCR._dlt_id) as pr_review_comment_reaction_id,
    CONCAT('vfs-',PRRRC._dlt_id) as pr_review_comment_id,
    CONCAT('vfs-',PRRR._dlt_id) as pr_review_id,
    CONCAT('vfs-',PR.number) as pr_id,
    PRRRCR.content

    FROM `dlthub-analytics.dwh_github_vfs_raw.pull_requests__reviews__nodes__comments__nodes` PRRRC 
    JOIN `dlthub-analytics.dwh_github_vfs_raw.pull_requests__reviews__nodes__comments__nodes__reactions__nodes` PRRRCR 
    ON PRRRC._dlt_id = PRRRCR._dlt_parent_id
    JOIN `dlthub-analytics.dwh_github_vfs_raw.pull_requests__reviews__nodes` PRRR 
    ON PRRR._dlt_id = PRRRC._dlt_parent_id
    JOIN `dlthub-analytics.dwh_github_vfs_raw.pull_requests` PR
    ON PR._dlt_id = PRRR._dlt_parent_id
    
)

SELECT * FROM base
