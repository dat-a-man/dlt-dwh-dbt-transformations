-- models/dlt_repo_review.sql
WITH base AS (

    SELECT 
    CONCAT('vfs-',PRRR._dlt_id) as pr_review_id,
    CONCAT('vfs-',PR.number) as pr_id,
    PRRR.body as review_body,
    PRRR.url review_url,
    PRRR.author__login as author_reviewed,
    PRRR.author_association

    FROM `dlthub-analytics.dwh_github_vfs_raw.pull_requests` PR 
    JOIN `dlthub-analytics.dwh_github_vfs_raw.pull_requests__reviews__nodes` PRRR 
    ON PR._dlt_id = PRRR._dlt_parent_id

)

SELECT * FROM base
