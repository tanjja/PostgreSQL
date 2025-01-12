CREATE DATABASE sql_course;

-- DROP DATABASE IF EXISTS sql_course;

SELECT job_postings_fact.job_title_short, 
    job_postings_fact.job_title, 
    company_dim.name,
    job_postings_fact.job_via,
    job_postings_fact.job_schedule_type,
    job_postings_fact.job_no_degree_mention,
    job_postings_fact.job_posted_date,
    job_postings_fact.job_country,
    job_postings_fact.salary_hour_avg,
    job_postings_fact.salary_rate
FROM job_postings_fact
LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id
WHERE job_location LIKE '%Anywhere%'
    AND job_no_degree_mention = true
    AND job_title LIKE '%Data%Analyst%'
    AND job_country = 'Philippines'
    AND job_title LIKE '%Intern%'
ORDER BY name ASC;

    -- AND name = 'Luxasia';