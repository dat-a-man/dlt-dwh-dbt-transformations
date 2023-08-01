-- models/dlt_repo_pr_comments.sql
WITH base AS (

    SELECT 
    Concat('dlt-',PRC.id) as pr_comment_id,
    Concat('dlt-',PR.number) as pr_id,
    PRC.body as comment_body,
    PRC.author__login as author_commented,
    PRC.author_association,
    PRC.created_at,
    PRC.reactions_total_count as comment_total_reactions

    FROM `dlthub-analytics.dwh_github_dlt_raw.pull_requests__comments` PRC 
    JOIN `dlthub-analytics.dwh_github_dlt_raw.pull_requests` PR 
    ON PR._dlt_id = PRC._dlt_parent_id

)

SELECT * FROM base
