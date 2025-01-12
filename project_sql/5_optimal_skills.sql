/*
Objective: Find best skills to learn based on both demand & average salary

Procedure
1. Utilize queries 3 & 4 
*/

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(job_postings_fact.job_id) as demand_count
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short IN ('Data Analyst','Business Analyst')
        AND job_work_from_home = True
        AND salary_year_avg IS NOT NULL

    GROUP BY
        skills_dim.skill_id
),

skill_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg)) AS avg_skill_salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short IN ('Data Analyst','Business Analyst')
        -- AND job_location IN ('Philippines', 'Anywhere')
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
    GROUP BY
        skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_skill_salary
FROM
    skills_demand
INNER JOIN
    skill_salary
ON skills_demand.skill_id =  skill_salary.skill_id
WHERE demand_count > 10
ORDER BY 
    avg_skill_salary DESC,
    demand_count DESC
    
LIMIT 25