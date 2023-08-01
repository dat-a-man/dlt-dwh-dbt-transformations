-- models/github_issues.sql

WITH base AS (
  SELECT
    CONCAT('dlt-',I.number) AS issue_id,
    I.url,
    I.title,
    I.body,
    I.author__login AS author,
    IAN.login AS assigned_to,
    I.author_association,
    ILN.name AS label,
    I.state,
    I.created_at,
    I.updated_at,
    I.reactions_total_count,
    I.comments_total_count
  FROM
    `dlt-dev-external.dwh_github_dlt_raw_20230729102531.issues` I
  JOIN
    dlt-dev-external.dwh_github_dlt_raw_20230729102531.issues__assignees__nodes IAN
  ON
    I._dlt_id = IAN._dlt_parent_id
  JOIN
    dlt-dev-external.dwh_github_dlt_raw_20230729102531.issues__labels__nodes ILN
  ON
    I._dlt_id = ILN._dlt_parent_id
)

SELECT * FROM base
