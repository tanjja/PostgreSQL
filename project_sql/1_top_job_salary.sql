/*
Objective: Find which data and business analyst jobs have the highest salaries

Procedure:
1. Filter job titles which include the words "business", "data", and "analyst"
2. Remove jobs which have no salary (nulls)
3. Order by salary per year average

Additional:
- Filter jobs available in the Philippines or remotely (Smaller dataset)
*/

SELECT
    job_id,
    job_title,
    name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
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
LIMIT 10;