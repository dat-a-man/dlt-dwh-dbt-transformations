
WITH base AS (
    SELECT
        CONCAT('dlt-',ICR._dlt_id) AS reaction_id,
        CONCAT('dlt-',IC.id) AS comment_id,
        CONCAT('dlt-',I.number) AS issue_id,
        ICR.user__login AS author_reacted,
        ICR.content AS author_reaction,
        ICR.created_at as reacted_at
    FROM
        `dlt-dev-external.dwh_github_dlt_raw_20230729102531.issues` I
    JOIN
        `dlt-dev-external.dwh_github_dlt_raw_20230729102531.issues__comments` IC
    ON
        I._dlt_id = IC._dlt_parent_id
    JOIN
        `dlt-dev-external.dwh_github_dlt_raw_20230729102531.issues__comments__reactions` ICR
    ON
        IC._dlt_id = ICR._dlt_parent_id
)

SELECT * FROM base
