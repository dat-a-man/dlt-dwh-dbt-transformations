
WITH base AS (
    SELECT
        CONCAT('vfs-',ICR._dlt_id) AS reaction_id,
        CONCAT('vfs-',IC.id) AS comment_id,
        CONCAT('vfs-',I.number) AS issue_id,
        ICR.user__login AS author_reacted,
        ICR.content AS author_reaction,
        ICR.created_at as reacted_at
    FROM
        `dlthub-analytics.dwh_github_vfs_raw.issues` I
    JOIN
        `dlthub-analytics.dwh_github_vfs_raw.issues__comments` IC
    ON
        I._dlt_id = IC._dlt_parent_id
    JOIN
        `dlthub-analytics.dwh_github_vfs_raw.issues__comments__reactions` ICR
    ON
        IC._dlt_id = ICR._dlt_parent_id
)

SELECT * FROM base
