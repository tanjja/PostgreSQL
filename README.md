## Introduction 📊💼

This project analyzes a database of job postings from sources like LinkedIn to answer key questions about data analyst and business analyst roles. It provides insights into top-paying jobs, in-demand skills, salary averages, and optimal skills for career growth.

Whether you're looking to enhance your skillset or explore job opportunities, this analysis has you covered! 🚀

Check out the queries here: [project_sql folder](/project_sql)

## Background

This project analyzes job postings from various sources, including LinkedIn, to uncover trends in the data analyst and business analyst roles. It aims to provide insights that help job seekers and professionals identify top-paying roles, understand in-demand skills, and make informed decisions about career and skill development.

The analysis focuses on answering the following key questions:

1. What are the top data analyst and business analyst jobs based on salary?
2. What skills are most commonly found in these high-paying jobs?
3. What skills are most in-demand for remote data analyst and business analyst roles?
4. What is the average salary for jobs that require each skill?
5. What is the optimal skill to learn based on both demand and salary?

# Tools Used

For this project, listed down below are the key tools that made this analysis possible:

- **SQL:** Used to allow for queries from the initial job postings csv files.
- **PostgreSQL:** Initially learning MySQL, this project served as a good transition into learning database management systems.
- **Git & GitHub:** Utilized for its version control capabilities as well as sharing and tracking the project as a whole

# Analysis

Focusing on specific aspects of the data provided, each query gives valuable insights about the job market.

### 1. Top Paying Data Analyst Jobs

To identify which roles paid the highest, the data was filtered to the postings whose short job titles were either "Data Analyst" or "Business Analyst". To ensure the rows remaining would be valuable, an additional step was done to ensure that the data left had data for salary and was not null. Finally, to fit this data more to my specific context, the data was filtered to locations listed either in the Philippines, or listed as Anywhere.

```sql
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
```

# What I Learned

# Conclusions
