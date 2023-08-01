-- models/issue_comments.sql

WITH base AS (

SELECT
  CONCAT('vfs-',IC.id) AS comment_id,
  CONCAT('vfs-',I.number) AS issue_id,
  IC.body as comment_body,
  IC.author__login as author_commented, 
  IC.created_at as commented_at
FROM
  `dlthub-analytics.dwh_github_vfs_raw.issues` I
JOIN
  `dlthub-analytics.dwh_github_vfs_raw.issues__comments` IC
ON
  I._dlt_id = IC._dlt_parent_id

)

SELECT * FROM base
