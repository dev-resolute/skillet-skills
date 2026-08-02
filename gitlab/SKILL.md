---
name: GitLab
description: Browse projects, merge requests, issues, and pipelines on gitlab.com.
---

# GitLab

Read-side coverage of the GitLab REST API (gitlab.com): the current user,
projects (list/get, with membership and search filters), project issues
(list/get + notes), merge requests (list/get + changes + commits + notes),
pipelines (list/get + jobs), repository branches and tags (list/get each),
repository commits (list/get + commit statuses), the repository tree and
file contents, milestones (list/get), and groups (list/get + a group's
projects).

Auth: personal access token (`read_api` scope) as a `PRIVATE-TOKEN` header.
