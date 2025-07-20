/*
What are the most optimal skills to learn(aka its in high demand and high paying skill)?
1. Identify the skills with high demand associated with high average salaries for Data Analyst roles
2. Concentrates on remote ppositions with specified salaries
3. Why? Targets skills that offer job security and financial benefits
offering strategic insights for career development in data analysis  
*/

Select
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' 
AND salary_year_avg is NOT NULL
-- AND job_work_from_home = 'True'
GROUP BY
    skills_dim.skill_id 
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;