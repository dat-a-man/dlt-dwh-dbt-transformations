-- models/dlt_repo_pr.sql
WITH base AS (

    SELECT 
    CONCAT('dlt-',number) as pr_id,
    url,
    title,
    body,
    author__login as author,
    author_association,
    state,
    is_cross_repository,
    head_repository__name_with_owner,
    base_repository__name_with_owner,
    created_at,
    updated_at,
    reviews__total_count,
    reactions_total_count,
    comments_total_count, 
    closed_at,
    merged_at,
    merged_by__login

    FROM `dlt-dev-external.dwh_github_dlt_raw_20230729102531.pull_requests`

)

SELECT * FROM base
