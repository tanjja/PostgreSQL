/*
Objective: Find average salary for all jobs containing specific skills

Procedure
1. Filter analyst jobs with listed skills
2. Group by skill name
3. Aggregate job salary
4. Order by job salary
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg)) AS avg_skill_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short IN ('Data Analyst','Business Analyst')
    -- AND job_location IN ('Philippines', 'Anywhere')
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_skill_salary DESC
LIMIT 20