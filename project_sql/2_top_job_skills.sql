/*
Objective: Find skills needed for the top-paying analyst jobs

Procedure
1. Utilize query from top paying jobs
2. List Skills needed for each role
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        name AS company_name,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN 
        company_dim
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short IN ('Data Analyst','Business Analyst')
        AND job_location IN ('Philippines', 'Anywhere')
        AND salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    skills,
    COUNT(skills) AS skill_demand
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY skills
ORDER BY
    COUNT(skills) DESC