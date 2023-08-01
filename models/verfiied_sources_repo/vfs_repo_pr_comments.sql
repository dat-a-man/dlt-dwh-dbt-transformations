-- models/dlt_repo_pr_comments.sql
WITH base AS (

    SELECT 
    Concat('vfs-',PRC.id) as pr_comment_id,
    Concat('vfs-',PR.number) as pr_id,
    PRC.body as comment_body,
    PRC.author__login as author_commented,
    PRC.author_association,
    PRC.created_at,
    PRC.reactions_total_count as comment_total_reactions

    FROM `dlt-dev-external.dwh_github_vfs_raw_20230731050204.pull_requests__comments` PRC 
    JOIN `dlt-dev-external.dwh_github_vfs_raw_20230731050204.pull_requests` PR 
    ON PR._dlt_id = PRC._dlt_parent_id

)

SELECT * FROM base
