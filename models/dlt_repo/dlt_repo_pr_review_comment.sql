-- models/dlt_repo_pr_review_commment.sql
WITH base AS (

    SELECT 
    CONCAT('dlt-',PRRRC._dlt_id) as pr_review_comment_id,
    CONCAT('dlt-',PRRR._dlt_id) as pr_review_id,
    CONCAT('dlt-',PR.number) as pr_id,
    PRRRC.body as review_comment_body,
    PRRRC.author__login as author_reviewed,
    PRRRC.url as review_url,
    PRRRC.reactions__total_count as total_PR_review_comm_reac_count

    FROM `dlt-dev-external.dwh_github_dlt_raw_20230729102531.pull_requests__reviews__nodes__comments__nodes` PRRRC 
    JOIN `dlt-dev-external.dwh_github_dlt_raw_20230729102531.pull_requests__reviews__nodes` PRRR 
    ON PRRR._dlt_id = PRRRC._dlt_parent_id
    JOIN `dlt-dev-external.dwh_github_dlt_raw_20230729102531.pull_requests` PR
    ON PR._dlt_id = PRRR._dlt_parent_id

)

SELECT * FROM base
