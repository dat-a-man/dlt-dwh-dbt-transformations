-- models/dlt_repo_pr_review_commment.sql
WITH base AS (

    SELECT 
    CONCAT('vfs-',PRRRC._dlt_id) as pr_review_comment_id,
    CONCAT('vfs-',PRRR._dlt_id) as pr_review_id,
    CONCAT('vfs-',PR.number) as pr_id,
    PRRRC.body as review_comment_body,
    PRRRC.author__login as author_reviewed,
    PRRRC.url as review_url,
    PRRRC.reactions__total_count as total_PR_review_comm_reac_count

    FROM `dlthub-analytics.dwh_github_vfs_raw.pull_requests__reviews__nodes__comments__nodes` PRRRC 
    JOIN `dlthub-analytics.dwh_github_vfs_raw.pull_requests__reviews__nodes` PRRR 
    ON PRRR._dlt_id = PRRRC._dlt_parent_id
    JOIN `dlthub-analytics.dwh_github_vfs_raw.pull_requests` PR
    ON PR._dlt_id = PRRR._dlt_parent_id

)

SELECT * FROM base
