-- models/dlt_repo_pr_review_comment_reactions.sql
WITH base AS (

    SELECT 
    CONCAT('dlt-',PRRRCR._dlt_id) as pr_review_comment_reaction_id,
    CONCAT('dlt-',PRRRC._dlt_id) as pr_review_comment_id,
    CONCAT('dlt-',PRRR._dlt_id) as pr_review_id,
    CONCAT('dlt-',PR.number) as pr_id,
    PRRRCR.content

    FROM `dlt-dev-external.dwh_github_dlt_raw_20230729102531.pull_requests__reviews__nodes__comments__nodes` PRRRC 
    JOIN `dlt-dev-external.dwh_github_dlt_raw_20230729102531.pull_requests__reviews__nodes__comments__nodes__reactions__nodes` PRRRCR 
    ON PRRRC._dlt_id = PRRRCR._dlt_parent_id
    JOIN `dlt-dev-external.dwh_github_dlt_raw_20230729102531.pull_requests__reviews__nodes` PRRR 
    ON PRRR._dlt_id = PRRRC._dlt_parent_id
    JOIN `dlt-dev-external.dwh_github_dlt_raw_20230729102531.pull_requests` PR
    ON PR._dlt_id = PRRR._dlt_parent_id
    
)

SELECT * FROM base
