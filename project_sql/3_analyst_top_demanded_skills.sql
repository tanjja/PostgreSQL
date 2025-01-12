/*
Objective: Find most demanded skills for analyst jobs

Procedure
1. Filter analyst jobs with listed skills
2. Group by skill name
3. Order by number of skill counted
*/

SELECT
    skills,
    COUNT(job_postings_fact.job_id) as skill_demand
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short IN ('Data Analyst','Business Analyst')
    AND job_location IN ('Philippines', 'Anywhere')
GROUP BY
    skills
ORDER BY skill_demand DESC
LIMIT 10