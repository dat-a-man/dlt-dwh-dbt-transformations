WITH base AS (
  SELECT
        CONCAT('vfs-', IR._dlt_id) as issue_reaction_id,
        CONCAT('vfs-',I.number) AS issue_id,
        IR.user__login AS author_reactedto_issue,
        IR.content AS issue_reaction,
        IR.created_at as issue_reacted_at
    FROM
      `dlt-dev-external.dwh_github_vfs_raw_20230731050204.issues` I
    JOIN
      `dlt-dev-external.dwh_github_vfs_raw_20230731050204.issues__reactions` IR
    ON
      I._dlt_id = IR._dlt_parent_id
)

SELECT * FROM base