/*
Question: What are the top-paying data analyst jobs?
1. Identify the top 10 highest paying data analyst roles that are available remotely
2. Focuses on job postings with specified values (remove nulls)
3. Why? Highlight the top-paying opportunities for Data Analysis, offering insights into 
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name as company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_work_from_home='TRUE' 
    AND salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC
LIMIT 10;